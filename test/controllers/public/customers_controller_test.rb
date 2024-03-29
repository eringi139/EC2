require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_customers_edit_url
    assert_response :success
  end

  test "should get uodate" do
    get public_customers_uodate_url
    assert_response :success
  end

  test "should get confirm_withdraw" do
    get public_customers_confirm_withdraw_url
    assert_response :success
  end

  test "should get withdraw" do
    get public_customers_withdraw_url
    assert_response :success
  end
end
