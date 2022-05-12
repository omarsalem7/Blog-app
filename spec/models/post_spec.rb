require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'post test cases validations' do
    before(:each) do
      @user = User.new(name: 'omar', photo: 'imagelink', bio: 'software enginner')
      @post = Post.new(user: @user, title: 'asd title', text: 'My hello')
    end

    it 'validate post' do
      expect(@post).to be_valid
    end

    it 'title should be present' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'if comments counter is float' do
      @post.comments_counter = 0.25
      expect(@post).not_to be_valid
    end

    it 'post counter must be an integer' do
      @post.comments_counter = 'hello'
      expect(@post).to_not be_valid
    end

    it 'post counter must 0 or greater than not negative numbers' do
      @post.likes_counter = -1
      expect(@post).to_not be_valid
    end

    it 'test recent_five_comments method' do
      expect(@post.recent_five_comments.length).to be(0)
    end

    it 'test recent_five_comments method' do
      expect(@post.recent_five_comments.length).to be(0)
    end

    it 'test update_post_counter method' do
      @post.update_post_counter
      expect(@user.posts_counter).to be(1)
    end
  end
end
