require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'omar', photo: 'image_link.jpg', bio: 'Developer from Egypt', email: 'test@email.com',
                        password: 'password', confirmed_at: Time.now)
    @post = Post.create(user: @user, title: 'title', text: 'text')
    (1..5).each do |i|
      @user.posts.create title: "Post number #{i}", text: "This is my #{i} post!"
      @post.update_post_counter
    end
    @comment = Comment.create(text: 'My first comment', user: @user, post_id: @post.id)
    @comment.update_comment_counter
    @comment = Comment.create(text: 'My second comment', user: @user, post_id: @post.id)
    @comment.update_comment_counter
    @like = Like.create(user: @user, post_id: @post.id)
    @like.update_like_counter
    visit new_user_session_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit user_post_path(user_id: @post.user_id, id: @post.id)
  end
  describe 'tests for view posts#show' do
    it 'test the posts title.' do
      expect(page).to have_content 'title'
    end

    it 'Can see who wrote the post' do
      expect(page).to have_content 'omar'
    end

    it 'how many comments it has' do
      expect(page).to have_content 'Comments: 2'
    end

    it 'how many likes it has' do
      expect(page).to have_content 'Likes: 1'
    end

    it 'the post body' do
      expect(page).to have_content 'text'
    end

    it 'name of each commentor' do
      expect(page).to have_content 'omar'
    end

    it 'Can see the comment each commentor left' do
      expect(page).to have_content 'My first comment'
      expect(page).to have_content 'My second comment'
    end
  end
end
