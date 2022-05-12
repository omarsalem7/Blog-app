require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.new(name: 'omar', photo: 'imagelink', bio: 'software enginner')
    @post = Post.new(user: @user, title: 'asd title', text: 'My hello')
    @comment = Comment.new(text: 'First comment', user_id: @user.id, post_id: @post.id)
  end

  it 'text should be present' do
    @comment.text = nil
    expect(@comment).to_not be_valid
  end

  it 'if post_id is integer' do
    @comment.post_id = '123'
    expect(@comment).to_not be_valid
  end
end
