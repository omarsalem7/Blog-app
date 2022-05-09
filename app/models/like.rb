class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #   A method that updates the likes counter for a post.

  def update_like_counter
    post.increment(:likes_counter)
  end
end
