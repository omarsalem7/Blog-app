require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get users' do
    get users_users_url
    assert_response :success
  end
end
