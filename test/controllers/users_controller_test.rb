require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get login_form" do
    get users_login_form_url
    assert_response :success
  end

  test "should get signup_form" do
    get users_signup_form_url
    assert_response :success
  end

  test "should get signup_done" do
    get users_signup_done_url
    assert_response :success
  end

  test "should get signup_certificated" do
    get users_signup_certificated_url
    assert_response :success
  end

  test "should get forgot_password_form" do
    get users_forgot_password_form_url
    assert_response :success
  end

  test "should get forgot_password_done" do
    get users_forgot_password_done_url
    assert_response :success
  end

  test "should get reset_password_form" do
    get users_reset_password_form_url
    assert_response :success
  end

  test "should get reset_password_done" do
    get users_reset_password_done_url
    assert_response :success
  end

  test "should get profile_form" do
    get users_profile_form_url
    assert_response :success
  end

  test "should get profile_done" do
    get users_profile_done_url
    assert_response :success
  end

  test "should get skillset_form" do
    get users_skillset_form_url
    assert_response :success
  end

  test "should get portfolio_index" do
    get users_portfolio_index_url
    assert_response :success
  end

  test "should get update_portfolio_form" do
    get users_update_portfolio_form_url
    assert_response :success
  end

  test "should get update_portfolio_done" do
    get users_update_portfolio_done_url
    assert_response :success
  end

  test "should get create_portfolio_form" do
    get users_create_portfolio_form_url
    assert_response :success
  end

  test "should get create_portfolio_done" do
    get users_create_portfolio_done_url
    assert_response :success
  end

  test "should get invitaion_form" do
    get users_invitaion_form_url
    assert_response :success
  end

  test "should get email_form" do
    get users_email_form_url
    assert_response :success
  end

  test "should get email_done" do
    get users_email_done_url
    assert_response :success
  end

  test "should get password_form" do
    get users_password_form_url
    assert_response :success
  end

  test "should get password_form" do
    get users_password_form_url
    assert_response :success
  end

  test "should get sns_form" do
    get users_sns_form_url
    assert_response :success
  end

  test "should get sns_done" do
    get users_sns_done_url
    assert_response :success
  end

  test "should get resign_form" do
    get users_resign_form_url
    assert_response :success
  end

  test "should get resign_done" do
    get users_resign_done_url
    assert_response :success
  end

  test "should get new_email_done" do
    get users_new_email_done_url
    assert_response :success
  end

end
