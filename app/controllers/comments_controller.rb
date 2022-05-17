class CommentsController < ApplicationController
  def new
    @current_user = current_user
    @new_comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @new_comment = Comment.create(comment_params)
    @new_comment.user = current_user
    @new_comment.post = @post

    if @new_comment.save
      flash[:notice] = 'Your comment created successfully'
      @new_comment.update_comment_counter
      redirect_to user_post_path(current_user.id, @post.id)
    else
      render :new, alert: 'An error occurred while creating the comment'
    end
  end

  def destroy
    deleted_comment = Comment.find(params[:id])
    post = Post.find(params[:post_id])
    post.comments_counter -= 1
    deleted_comment.destroy
    if post.save
      redirect_to user_post_path(params[:user_id], post.id), notice: 'You have deleted the comment successfully!'
    else
      render :new, alert: 'An error has occurred while deleting the comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
