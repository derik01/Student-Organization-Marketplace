class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_product, :initialize_cart, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @user = User.find_by_id(session[:id])
    @products = @user.products.all
  end

  def tag_index
    @user = User.find_by_id(session[:id])
    @tag = params[:tag]
    params[:tag] ? @products = @user.products.tagged_with(params[:tag]) : @products = @user.products.all
  end 

  def marketplace
    @tags = Tag.all
    @users = User.all
    @products = Product.all
  end

  def initialize_cart
    session[:cart] ||= []
  end

  def view_cart
    @cart_ids = session[:cart]
    @total = 0
    @cart_ids.each do |cart_id|
      @total += Product.find_by_id(cart_id).price
    end
  end 

  def add_to_cart
    session[:cart] << params[:product_id]
    redirect_to "/marketplace"
  end

  def org_marketplace
    @products = Product.where(user_id: params[:org_id])
  end

  def tag_marketplace
    @selected_tag = Tag.find_by_id(params[:tag_id]).name

    @product_ids = Tagging.where(tag_id: params[:tag_id]).pluck(:product_id)

    @products = Product.where(id: @product_ids)

    # @products = @taggings.where(@)
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @user = User.find_by_id(session[:id])
    product_params = params.require(:product).permit(:title, :image, :price, :tag_list, :tag, { tag_ids: [] }, :tag_ids, :quantity)
    @product = @user.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    product_params = params.require(:product).permit(:title, :image, :price, :tag_list, :tag, { tag_ids: [] }, :tag_ids, :quantity)
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @user = User.find_by_id(session[:id])
    @product = @user.products.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # def product_params
  #   params.require(:product).permit(:title, :image)
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :image, :price, :tag_list, :tag, { tag_ids: [] }, :tag_ids, :quantity)
    end
end
