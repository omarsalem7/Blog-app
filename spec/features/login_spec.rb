require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before(:each) do
    User.create(name: 'omar', photo: 'image_link', bio: 'Developer from Egypt', email: 'test@email.com',
                password: 'password', confirmed_at: Time.now)
    visit user_session_path
  end
  describe 'tests for view login' do
    it 'I can see the username and password inputs and the Submit button.' do
      expect(page).to have_field(type: 'email')
      expect(page).to have_field(type: 'password')
      expect(page).to have_button(type: 'submit')
    end

    it 'sign me in' do
      visit new_user_session_path
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully'
    end

    it 'without filling in the username and the password get error' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'with incorrect data, I get a detailed error' do
      visit new_user_session_path
      fill_in 'Email', with: 'test123@email.com'
      fill_in 'Password', with: 'password123'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'with correct data, I am redirected to the root page' do
      visit new_user_session_path
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(current_path).to eq root_path
    end
  end
end
