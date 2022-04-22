require 'rails_helper'

RSpec.describe ProductsController, type: :controller do 
    before(:all) do
        # @image = fixture_file_upload("water_bottle_metal.jpg")
        # if Product.where(:title => "Metal Bottle").empty?
        #   Product.create(:title => "Metal Bottle", :image => @image)
        # end

        if User.where(:username => "rspec_user@gmail.com").empty?
            User.create(:username => "rspec_user@gmail.com", :password => "12345678", :first => "rspec")
        end
    end

    describe "creates" do
        it "product with valid parameters" do
            # @image2 = Rack::Test::UploadedFile.new("features/test_images/water_bottle.jpg")
            file = Rails.root.join('features', 'test_images', 'water_bottle.jpg')
            image = ActiveStorage::Blob.create_and_upload!(
                io: File.open(file, 'rb'),
                 filename: 'water_bottle.jpg',
                 content_type: 'image/jpg' # Or figure it out from `name` if you have non-JPEGs
               ).signed_id
            @user = User.find_by_username('rspec_user@gmail.com')
            get :create, params: {:product => {:title => "Bottle", :image => image, :price => 10.99, :quantity => 5}}, session: {:id => @user.id}
            # expect(response).to redirect product_url + "/" + product.id.to_s
            expect(flash[:notice]).to match(/Product was successfully created./)
            # Product.find_by(:title => "Bottle").destroy
        end
    end

    describe "deletes" do
        it "an existing product" do
            product = Product.find_by_title("Bottle")
            @user = User.find_by_username('rspec_user@gmail.com')
            post :destroy, params: {:id => product.id}, session: {:id => @user.id}
            expect(response).to redirect_to products_url
            expect(flash[:notice]).to match(/Product was successfully destroyed./)
        end
    end

    describe "updates" do
        it "an existing product" do
            product = Product.find_by_title("Metal Bottle")
            get :update, params: {:id => product.id, :product => {:title => "A Bottle"}}
            expect(response).to redirect_to products_url + "/" + product.id.to_s
            expect(flash[:notice]).to match(/Product was successfully updated./)
        end
    end

    describe "gets" do
        it "the marketplace" do
            get :marketplace
        end
    end

    describe "gets" do
        it "new product" do
            get :new
        end
    end
end