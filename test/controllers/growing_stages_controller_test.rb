require 'test_helper'

class GrowingStagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @growing_stage = growing_stages(:one)
  end

  test "should get index" do
    get growing_stages_url
    assert_response :success
  end

  test "should get new" do
    get new_growing_stage_url
    assert_response :success
  end

  test "should create growing_stage" do
    assert_difference('GrowingStage.count') do
      post growing_stages_url, params: { growing_stage: { first_growth_on: @growing_stage.first_growth_on, growing_id: @growing_stage.growing_id, growing_medium: @growing_stage.growing_medium, location: @growing_stage.location, notes: @growing_stage.notes, num_growing: @growing_stage.num_growing, num_lost: @growing_stage.num_lost, num_started: @growing_stage.num_started, stage_type: @growing_stage.stage_type, started_on: @growing_stage.started_on } }
    end

    assert_redirected_to growing_stage_url(GrowingStage.last)
  end

  test "should show growing_stage" do
    get growing_stage_url(@growing_stage)
    assert_response :success
  end

  test "should get edit" do
    get edit_growing_stage_url(@growing_stage)
    assert_response :success
  end

  test "should update growing_stage" do
    patch growing_stage_url(@growing_stage), params: { growing_stage: { first_growth_on: @growing_stage.first_growth_on, growing_id: @growing_stage.growing_id, growing_medium: @growing_stage.growing_medium, location: @growing_stage.location, notes: @growing_stage.notes, num_growing: @growing_stage.num_growing, num_lost: @growing_stage.num_lost, num_started: @growing_stage.num_started, stage_type: @growing_stage.stage_type, started_on: @growing_stage.started_on } }
    assert_redirected_to growing_stage_url(@growing_stage)
  end

  test "should destroy growing_stage" do
    assert_difference('GrowingStage.count', -1) do
      delete growing_stage_url(@growing_stage)
    end

    assert_redirected_to growing_stages_url
  end
end
