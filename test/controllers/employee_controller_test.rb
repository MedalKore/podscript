require 'test_helper'

class EmployeeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get accept_a_job" do
    get :accept_a_job
    assert_response :success
  end

  test "should get submit_a_completed_job" do
    get :submit_a_completed_job
    assert_response :success
  end

  test "should get account_details" do
    get :account_details
    assert_response :success
  end

end
