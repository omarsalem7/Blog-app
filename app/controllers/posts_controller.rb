class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @likes = @post.likes
    @user_s = User.find(@post.user_id)
  end

  def new
    @current_user = current_user
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(post_params)
    @new_post.user = current_user

    if @new_post.save
      @new_post.update_post_counter
      redirect_to user_path(@new_post.user_id), notice: 'You have successfully created a new post.'
    else
      render :new, alert: 'An error has occurred while creating the post'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
