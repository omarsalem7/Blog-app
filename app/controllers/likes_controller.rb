class LikesController < ApplicationController
  def new
    @new_like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @new_like = Like.new
    @new_like.user = @user
    @new_like.post = @post

    if @new_like.save
      @new_like.update_like_counter
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
    else
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id),
                  alert: 'An error occurred while creating the like'
    end
  end
end
