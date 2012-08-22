require "spec_helper"

describe RatingsController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
    @rating = FactoryGirl.attributes_for(:rating, user_id: @user, post_id: @post)
    controller.stub!(:current_user).and_return(@user)
    request.env["HTTP_REFERER"] = "http://test.host/posts"
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new rating" do
        expect {
          post :create, user_id: @user, rating: @rating
        }.to change(Rating, :count).by(1)
      end
      
      it "assigns newly created rating as @rating" do
        post :create, rating: @rating
        assigns(:rating).should be_a(Rating)
        assigns(:rating).should be_persisted
      end
      
      it "redirects back" do
        post :create, rating: @rating
        response.should redirect_to(:back)
      end
    end 
    
    describe "with Invalid params" do
      it "assigns newly created but unsaved rating as @rating" do
        Rating.any_instance.stub(:save).and_return(false)
        post :create, rating: @rating
        assigns(:rating).should be_a_new(Rating)
      end  
      
      it "redirects back" do
        Rating.any_instance.stub(:save).and_return(false)
        post :create, rating: @rating
        response.should redirect_to(:back)
      end
    end
  end
end