class PostsController < ApplicationController
  
  def index
    @paginate_posts = Post.paginate(page: params[:page], per_page: 10).includes(:user).search(params[:search])
  end

  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
    respond_to do |format|
      format.html 
      format.json { render json: @post }
    end
  end


  def new
    @post = Post.new
    respond_to do |format|
      format.html 
      format.json { render json: @post }
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(params[:post])
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new", notice: "please sign in to post" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit", notice: "please try again" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
