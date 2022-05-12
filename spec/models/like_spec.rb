require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = User.create(name: 'omar', photo: 'imagelink', bio: 'software engineer')
    @post = Post.create(user: @user, title: 'sda title', text: 'My textsad s')
    @like = Like.create(user_id: @user.id, post_id: @post.id)
  end

  it 'if post_id is integer' do
    @like.user_id = 'ss'
    expect(@like).to_not be_valid
  end
  it 'if post_id is integer' do
    @like.post_id = '123'
    expect(@like).to_not be_valid
  end
end
