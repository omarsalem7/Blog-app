class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
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
      flash[:notice] = 'You have successfully created a new post.'
      redirect_to user_path(@new_post.user_id), notice: 'Post created successfully'
    else
      render :new, alert: 'An error occurred while creating the post'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
