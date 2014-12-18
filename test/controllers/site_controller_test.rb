require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get client" do
    get :client
    assert_response :success
  end

  test "should get operator" do
    get :operator
    assert_response :success
  end

end
