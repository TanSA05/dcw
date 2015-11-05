require 'test_helper'

class ForwardingControllerTest < ActionController::TestCase
  test "should get dcw_feedback" do
    get :dcw_feedback
    assert_response :success
  end

  test "should get cc_feedback" do
    get :cc_feedback
    assert_response :success
  end

  test "should get agency_feedback" do
    get :agency_feedback
    assert_response :success
  end

  test "should get interim" do
    get :interim
    assert_response :success
  end

  test "should get final" do
    get :final
    assert_response :success
  end

  test "should get do" do
    get :do
    assert_response :success
  end

end
