require "application_system_test_case"

class CoinsTest < ApplicationSystemTestCase
  setup do
    @coin = coins(:one)
  end

  test "visiting the index" do
    visit coins_url
    assert_selector "h1", text: "Coins"
  end

  test "should create coin" do
    visit coins_url
    click_on "New coin"

    fill_in "Category", with: @coin.category_id
    fill_in "Current price", with: @coin.current_price
    fill_in "Market cap", with: @coin.market_cap
    fill_in "Name", with: @coin.name
    fill_in "Symbol", with: @coin.symbol
    click_on "Create Coin"

    assert_text "Coin was successfully created"
    click_on "Back"
  end

  test "should update Coin" do
    visit coin_url(@coin)
    click_on "Edit this coin", match: :first

    fill_in "Category", with: @coin.category_id
    fill_in "Current price", with: @coin.current_price
    fill_in "Market cap", with: @coin.market_cap
    fill_in "Name", with: @coin.name
    fill_in "Symbol", with: @coin.symbol
    click_on "Update Coin"

    assert_text "Coin was successfully updated"
    click_on "Back"
  end

  test "should destroy Coin" do
    visit coin_url(@coin)
    click_on "Destroy this coin", match: :first

    assert_text "Coin was successfully destroyed"
  end
end
