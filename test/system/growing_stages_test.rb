require "application_system_test_case"

class GrowingStagesTest < ApplicationSystemTestCase
  setup do
    @growing_stage = growing_stages(:one)
  end

  test "visiting the index" do
    visit growing_stages_url
    assert_selector "h1", text: "Growing Stages"
  end

  test "creating a Growing stage" do
    visit growing_stages_url
    click_on "New Growing Stage"

    fill_in "First growth on", with: @growing_stage.first_growth_on
    fill_in "Growing", with: @growing_stage.growing_id
    fill_in "Growing medium", with: @growing_stage.growing_medium
    fill_in "Location", with: @growing_stage.location
    fill_in "Notes", with: @growing_stage.notes
    fill_in "Num growing", with: @growing_stage.num_growing
    fill_in "Num lost", with: @growing_stage.num_lost
    fill_in "Num started", with: @growing_stage.num_started
    fill_in "Stage type", with: @growing_stage.stage_type
    fill_in "Started on", with: @growing_stage.started_on
    click_on "Create Growing stage"

    assert_text "Growing stage was successfully created"
    click_on "Back"
  end

  test "updating a Growing stage" do
    visit growing_stages_url
    click_on "Edit", match: :first

    fill_in "First growth on", with: @growing_stage.first_growth_on
    fill_in "Growing", with: @growing_stage.growing_id
    fill_in "Growing medium", with: @growing_stage.growing_medium
    fill_in "Location", with: @growing_stage.location
    fill_in "Notes", with: @growing_stage.notes
    fill_in "Num growing", with: @growing_stage.num_growing
    fill_in "Num lost", with: @growing_stage.num_lost
    fill_in "Num started", with: @growing_stage.num_started
    fill_in "Stage type", with: @growing_stage.stage_type
    fill_in "Started on", with: @growing_stage.started_on
    click_on "Update Growing stage"

    assert_text "Growing stage was successfully updated"
    click_on "Back"
  end

  test "destroying a Growing stage" do
    visit growing_stages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Growing stage was successfully destroyed"
  end
end
