require 'test_helper'

class SowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sowing = sowings(:one)
  end

  test "should get index" do
    get sowings_url
    assert_response :success
  end

  test "should get new" do
    get new_sowing_url
    assert_response :success
  end

  test "should create sowing" do
    assert_difference('Sowing.count') do
      post sowings_url, params: { sowing: { compost_mix: @sowing.compost_mix, first_germinated_on: @sowing.first_germinated_on, location: @sowing.location, notes: @sowing.notes, num_germinated: @sowing.num_germinated, num_sown: @sowing.num_sown, potted_on: @sowing.potted_on, references: @sowing.references, sown_on: @sowing.sown_on } }
    end

    assert_redirected_to sowing_url(Sowing.last)
  end

  test "should show sowing" do
    get sowing_url(@sowing)
    assert_response :success
  end

  test "should get edit" do
    get edit_sowing_url(@sowing)
    assert_response :success
  end

  test "should update sowing" do
    patch sowing_url(@sowing), params: { sowing: { compost_mix: @sowing.compost_mix, first_germinated_on: @sowing.first_germinated_on, location: @sowing.location, notes: @sowing.notes, num_germinated: @sowing.num_germinated, num_sown: @sowing.num_sown, potted_on: @sowing.potted_on, references: @sowing.references, sown_on: @sowing.sown_on } }
    assert_redirected_to sowing_url(@sowing)
  end

  test "should destroy sowing" do
    assert_difference('Sowing.count', -1) do
      delete sowing_url(@sowing)
    end

    assert_redirected_to sowings_url
  end
end
