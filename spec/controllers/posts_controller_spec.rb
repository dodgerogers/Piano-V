require 'spec_helper'

describe PostsController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.attributes_for(:post, user_id: @user)
    controller.stub!(:current_user).and_return(@user)
  end

  describe "GET index" do
    it "renders index template" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new
      assigns(:post).should be_a_new(Post)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, user_id: @user, post: @post
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, post: @post
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created post" do
        post :create, post: @post
        response.should redirect_to(Post.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, post: @post
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        Post.any_instance.stub(:save).and_return(false)
        post :create, post: @post
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before(:each) do
      @post = FactoryGirl.create(:post, song: "qweqwe ew qew qew", song_name: "metallica")
    end
    
    it "assigns the requested post as @post" do
      put :update, id: @post, post: FactoryGirl.attributes_for(:post)
      assigns(:post).should eq(@post)
    end
    
    describe "with valid params" do
      it "updates the requested post" do
        put :update, id: @post, post: FactoryGirl.attributes_for(:post, song_name: "fuel")
        @post.reload
        @post.song_name.should eq("fuel")
      end

      #it "redirects to the post" do
      #  put :update, id: @post, post: FactoryGirl.attributes_for(:post, song_name: "fuel")
      #  response.should redirect_to @post
      #end
    end

    describe "with invalid params" do
      it "doesn not change @post attributes" do
        put :update, id: @post, post: FactoryGirl.attributes_for(:post, song_name: "")
        @post.reload
        @post.song_name.should_not eq("")
      end

      #it "re-renders the 'edit' template" do
      #  put :update, id: @post, post: FactoryGirl.attributes_for(:post)
      #  response.should redirect_to posts_url
      #end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @post = FactoryGirl.create(:post)
    end
    
    it "destroys the requested post" do
      expect {
        delete :destroy, id: @post
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      delete :destroy, id: @post
      response.should redirect_to posts_url
    end
  end

end
