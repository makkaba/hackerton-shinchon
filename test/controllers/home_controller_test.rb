require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get uppost_view" do
    get :uppost_view
    assert_response :success
  end

  test "should get detail" do
    get :detail
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
