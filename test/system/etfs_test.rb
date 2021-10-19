require "application_system_test_case"

class EtfsTest < ApplicationSystemTestCase
  setup do
    @etf = etfs(:one)
  end

  test "visiting the index" do
    visit etfs_url
    assert_selector "h1", text: "Etfs"
  end

  test "creating a Etf" do
    visit etfs_url
    click_on "New Etf"

    fill_in "Asset", with: @etf.asset_id
    fill_in "Description", with: @etf.description
    fill_in "Name", with: @etf.name
    click_on "Create Etf"

    assert_text "Etf was successfully created"
    click_on "Back"
  end

  test "updating a Etf" do
    visit etfs_url
    click_on "Edit", match: :first

    fill_in "Asset", with: @etf.asset_id
    fill_in "Description", with: @etf.description
    fill_in "Name", with: @etf.name
    click_on "Update Etf"

    assert_text "Etf was successfully updated"
    click_on "Back"
  end

  test "destroying a Etf" do
    visit etfs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Etf was successfully destroyed"
  end
end
