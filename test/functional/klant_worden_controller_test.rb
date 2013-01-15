require 'test_helper'

class KlantWordenControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
