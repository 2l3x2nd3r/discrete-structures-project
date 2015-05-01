require 'test_helper'

class AnnexesControllerTest < ActionController::TestCase
  test "should get video" do
    get :video
    assert_response :success
  end

  test "should get self_assessment" do
    get :self_assessment
    assert_response :success
  end

  test "should get engineering_report" do
    get :engineering_report
    assert_response :success
  end

end
