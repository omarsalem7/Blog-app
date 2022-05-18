require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'omar', photo: 'image_link', bio: 'Developer from Egypt', email: 'test@email.com',
                password: 'password', confirmed_at: Time.now)
    @post = Post.create(user: @user, title: 'My title', text: 'My text')
    @like = Like.create(user: @user, post_id: @post.id)
    @post.update_post_counter
    visit new_user_session_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  it 'Can see the name of user' do
    expect(page).to have_content 'omar'
  end

  it 'I can see the profile picture for each user' do
      expect(page.find("img")['src']).to have_content @user.photo
  end

  it 'number of posts of the user' do
    expect(page).to have_content 'Number of posts: 1'
  end

  it 'When I click on a user, I am redirected to that users show page' do
    click_link("Read More")
    expect(current_path).to eq user_path @user.id
  end
end