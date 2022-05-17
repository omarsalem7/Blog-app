class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @likes = @post.likes
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

  def destroy
    deleted_post = Post.find(params[:id])
    user = User.find(deleted_post.user_id)
    user.posts_counter -= 1
    deleted_post.destroy
    if user.save
      redirect_to user_path(params[:user_id]), notice: 'You have deleted this post successfully!'
    else
      render :new, alert: 'An error has occurred while deleting the post'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
