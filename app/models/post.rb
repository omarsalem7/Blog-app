class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_post_counter
    user.increment(:post_counter)
  end

  def recent_five_comments(post_id)
    Comment.where(post_id:).order(created_at: desc).first(5)
  end
end
