require "application_system_test_case"

class GrowingsTest < ApplicationSystemTestCase
  setup do
    @growing = growings(:one)
  end

  test "visiting the index" do
    visit growings_url
    assert_selector "h1", text: "Growings"
  end

  test "creating a Growing" do
    visit growings_url
    click_on "New Growing"

    fill_in "Compost mix", with: @growing.compost_mix
    fill_in "First germinated on", with: @growing.first_germinated_on
    fill_in "Location", with: @growing.location
    fill_in "Notes", with: @growing.notes
    fill_in "Num germinated", with: @growing.num_germinated
    fill_in "Num sown", with: @growing.num_sown
    fill_in "Potted on", with: @growing.potted_on
    fill_in "References", with: @growing.references
    fill_in "Sown on", with: @growing.sown_on
    click_on "Create Growing"

    assert_text "Growing was successfully created"
    click_on "Back"
  end

  test "updating a Growing" do
    visit growings_url
    click_on "Edit", match: :first

    fill_in "Compost mix", with: @growing.compost_mix
    fill_in "First germinated on", with: @growing.first_germinated_on
    fill_in "Location", with: @growing.location
    fill_in "Notes", with: @growing.notes
    fill_in "Num germinated", with: @growing.num_germinated
    fill_in "Num sown", with: @growing.num_sown
    fill_in "Potted on", with: @growing.potted_on
    fill_in "References", with: @growing.references
    fill_in "Sown on", with: @growing.sown_on
    click_on "Update Growing"

    assert_text "Growing was successfully updated"
    click_on "Back"
  end

  test "destroying a Growing" do
    visit growings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Growing was successfully destroyed"
  end
end
