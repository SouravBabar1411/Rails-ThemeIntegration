require "application_system_test_case"

class AnnoucementsTest < ApplicationSystemTestCase
  setup do
    @annoucement = annoucements(:one)
  end

  test "visiting the index" do
    visit annoucements_url
    assert_selector "h1", text: "Annoucements"
  end

  test "creating a Annoucement" do
    visit annoucements_url
    click_on "New Annoucement"

    fill_in "Game", with: @annoucement.game
    fill_in "Message", with: @annoucement.message
    click_on "Create Annoucement"

    assert_text "Annoucement was successfully created"
    click_on "Back"
  end

  test "updating a Annoucement" do
    visit annoucements_url
    click_on "Edit", match: :first

    fill_in "Game", with: @annoucement.game
    fill_in "Message", with: @annoucement.message
    click_on "Update Annoucement"

    assert_text "Annoucement was successfully updated"
    click_on "Back"
  end

  test "destroying a Annoucement" do
    visit annoucements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Annoucement was successfully destroyed"
  end
end
