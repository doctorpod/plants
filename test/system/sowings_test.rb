require "application_system_test_case"

class SowingsTest < ApplicationSystemTestCase
  setup do
    @sowing = sowings(:one)
  end

  test "visiting the index" do
    visit sowings_url
    assert_selector "h1", text: "Sowings"
  end

  test "creating a Sowing" do
    visit sowings_url
    click_on "New Sowing"

    fill_in "Compost mix", with: @sowing.compost_mix
    fill_in "First germinated on", with: @sowing.first_germinated_on
    fill_in "Location", with: @sowing.location
    fill_in "Notes", with: @sowing.notes
    fill_in "Num germinated", with: @sowing.num_germinated
    fill_in "Num sown", with: @sowing.num_sown
    fill_in "Potted on", with: @sowing.potted_on
    fill_in "References", with: @sowing.references
    fill_in "Sown on", with: @sowing.sown_on
    click_on "Create Sowing"

    assert_text "Sowing was successfully created"
    click_on "Back"
  end

  test "updating a Sowing" do
    visit sowings_url
    click_on "Edit", match: :first

    fill_in "Compost mix", with: @sowing.compost_mix
    fill_in "First germinated on", with: @sowing.first_germinated_on
    fill_in "Location", with: @sowing.location
    fill_in "Notes", with: @sowing.notes
    fill_in "Num germinated", with: @sowing.num_germinated
    fill_in "Num sown", with: @sowing.num_sown
    fill_in "Potted on", with: @sowing.potted_on
    fill_in "References", with: @sowing.references
    fill_in "Sown on", with: @sowing.sown_on
    click_on "Update Sowing"

    assert_text "Sowing was successfully updated"
    click_on "Back"
  end

  test "destroying a Sowing" do
    visit sowings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sowing was successfully destroyed"
  end
end
