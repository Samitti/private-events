require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get git" do
    get sessions_git_url
    assert_response :success
  end

  test "should get reset" do
    get sessions_reset_url
    assert_response :success
  end

end
