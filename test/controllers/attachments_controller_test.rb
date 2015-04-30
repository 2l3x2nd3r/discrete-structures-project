require 'test_helper'

class AttachmentsControllerTest < ActionController::TestCase
  test "should get attachment1" do
    get :attachment1
    assert_response :success
  end

  test "should get attachment2" do
    get :attachment2
    assert_response :success
  end

  test "should get attachment3" do
    get :attachment3
    assert_response :success
  end

  test "should get attachment4" do
    get :attachment4
    assert_response :success
  end

end
