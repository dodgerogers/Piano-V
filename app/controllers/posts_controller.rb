class PostsController < ApplicationController
  
  def index
    @posts = Post.search(params[:search])
    @paginate_posts = Post.paginate(page: params[:page], per_page: 15).search(params[:search])
  end

  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @ratings = @post.ratings
    respond_to do |format|
      format.html 
      format.json { render json: @post }
    end
  end


  def new
    @post = Post.new
    respond_to do |format|
      format.html # new.html.erb
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
        format.html { redirect_to @post, success: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new", error: "please sign in to post" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, success: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", error: "please try again" }
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
