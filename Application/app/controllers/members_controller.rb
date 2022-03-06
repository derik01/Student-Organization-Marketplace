class MembersController < ApplicationController
  # before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index
    @members = Member.all
  end

  # GET /members/1 or /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)
    if /\A[^@\s]+@[^@\s]+\z/.match(@member.username) == nil 
        flash[:notice] = "Invalid Username"
        redirect_to '/signup_member'
    elsif Member.find_by(username: @member.username)
        flash[:notice] = "Username already exists"
        redirect_to '/signup_member'
    elsif @member.password.length < 8
        flash[:notice] = "Password length should be 8 or longer."
        redirect_to '/signup_member'
    else @member.valid?
        @member = Member.create(params.require(:member).permit(:first, :last, :username, :password))
        session[:id] = @member.id
        session[:type] = "member"
        redirect_to '/mem_profile'
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to member_url(@member), notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy

    respond_to do |format|
      format.html { redirect_to '/', notice: "Member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_member
    #   @member = Member.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:username, :password, :first, :last)
    end
end
