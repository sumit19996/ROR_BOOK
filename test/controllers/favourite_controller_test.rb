require 'test_helper'

class FavouriteControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get favourite_update_url
    assert_response :success
  end

end
