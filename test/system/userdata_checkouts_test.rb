require "application_system_test_case"

class UserdataCheckoutsTest < ApplicationSystemTestCase
  setup do
    @userdata_checkout = userdata_checkouts(:one)
  end

  test "visiting the index" do
    visit userdata_checkouts_url
    assert_selector "h1", text: "Userdata Checkouts"
  end

  test "creating a Userdata checkout" do
    visit userdata_checkouts_url
    click_on "New Userdata Checkout"

    fill_in "Checkout", with: @userdata_checkout.checkout_id
    fill_in "City", with: @userdata_checkout.city
    fill_in "Country", with: @userdata_checkout.country
    fill_in "External number", with: @userdata_checkout.external_number
    fill_in "Internal number", with: @userdata_checkout.internal_number
    fill_in "Name", with: @userdata_checkout.name
    fill_in "State", with: @userdata_checkout.state
    fill_in "Street", with: @userdata_checkout.street
    fill_in "User", with: @userdata_checkout.user_id
    fill_in "Zip code", with: @userdata_checkout.zip_code
    click_on "Create Userdata checkout"

    assert_text "Userdata checkout was successfully created"
    click_on "Back"
  end

  test "updating a Userdata checkout" do
    visit userdata_checkouts_url
    click_on "Edit", match: :first

    fill_in "Checkout", with: @userdata_checkout.checkout_id
    fill_in "City", with: @userdata_checkout.city
    fill_in "Country", with: @userdata_checkout.country
    fill_in "External number", with: @userdata_checkout.external_number
    fill_in "Internal number", with: @userdata_checkout.internal_number
    fill_in "Name", with: @userdata_checkout.name
    fill_in "State", with: @userdata_checkout.state
    fill_in "Street", with: @userdata_checkout.street
    fill_in "User", with: @userdata_checkout.user_id
    fill_in "Zip code", with: @userdata_checkout.zip_code
    click_on "Update Userdata checkout"

    assert_text "Userdata checkout was successfully updated"
    click_on "Back"
  end

  test "destroying a Userdata checkout" do
    visit userdata_checkouts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Userdata checkout was successfully destroyed"
  end
end
