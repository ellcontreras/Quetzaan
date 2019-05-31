require 'test_helper'

class UserdataCheckoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userdata_checkout = userdata_checkouts(:one)
  end

  test "should get index" do
    get userdata_checkouts_url
    assert_response :success
  end

  test "should get new" do
    get new_userdata_checkout_url
    assert_response :success
  end

  test "should create userdata_checkout" do
    assert_difference('UserdataCheckout.count') do
      post userdata_checkouts_url, params: { userdata_checkout: { checkout_id: @userdata_checkout.checkout_id, city: @userdata_checkout.city, country: @userdata_checkout.country, external_number: @userdata_checkout.external_number, internal_number: @userdata_checkout.internal_number, name: @userdata_checkout.name, state: @userdata_checkout.state, street: @userdata_checkout.street, user_id: @userdata_checkout.user_id, zip_code: @userdata_checkout.zip_code } }
    end

    assert_redirected_to userdata_checkout_url(UserdataCheckout.last)
  end

  test "should show userdata_checkout" do
    get userdata_checkout_url(@userdata_checkout)
    assert_response :success
  end

  test "should get edit" do
    get edit_userdata_checkout_url(@userdata_checkout)
    assert_response :success
  end

  test "should update userdata_checkout" do
    patch userdata_checkout_url(@userdata_checkout), params: { userdata_checkout: { checkout_id: @userdata_checkout.checkout_id, city: @userdata_checkout.city, country: @userdata_checkout.country, external_number: @userdata_checkout.external_number, internal_number: @userdata_checkout.internal_number, name: @userdata_checkout.name, state: @userdata_checkout.state, street: @userdata_checkout.street, user_id: @userdata_checkout.user_id, zip_code: @userdata_checkout.zip_code } }
    assert_redirected_to userdata_checkout_url(@userdata_checkout)
  end

  test "should destroy userdata_checkout" do
    assert_difference('UserdataCheckout.count', -1) do
      delete userdata_checkout_url(@userdata_checkout)
    end

    assert_redirected_to userdata_checkouts_url
  end
end
