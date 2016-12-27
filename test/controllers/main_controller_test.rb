require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get newsfeed" do
    get main_newsfeed_url
    assert_response :success
  end

end
