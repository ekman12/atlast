require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get places_index_url
    assert_response :success
  end

  test "should get show" do
    get places_show_url
    assert_response :success
  end

end
