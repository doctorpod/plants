require 'test_helper'

class GrowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @growing = growings(:one)
  end

  test "should get index" do
    get growings_url
    assert_response :success
  end

  test "should get new" do
    get new_growing_url
    assert_response :success
  end

  test "should create growing" do
    assert_difference('Growing.count') do
      post growings_url, params: { growing: { compost_mix: @growing.compost_mix, first_germinated_on: @growing.first_germinated_on, location: @growing.location, notes: @growing.notes, num_germinated: @growing.num_germinated, num_sown: @growing.num_sown, potted_on: @growing.potted_on, references: @growing.references, sown_on: @growing.sown_on } }
    end

    assert_redirected_to growing_url(Growing.last)
  end

  test "should show growing" do
    get growing_url(@growing)
    assert_response :success
  end

  test "should get edit" do
    get edit_growing_url(@growing)
    assert_response :success
  end

  test "should update growing" do
    patch growing_url(@growing), params: { growing: { compost_mix: @growing.compost_mix, first_germinated_on: @growing.first_germinated_on, location: @growing.location, notes: @growing.notes, num_germinated: @growing.num_germinated, num_sown: @growing.num_sown, potted_on: @growing.potted_on, references: @growing.references, sown_on: @growing.sown_on } }
    assert_redirected_to growing_url(@growing)
  end

  test "should destroy growing" do
    assert_difference('Growing.count', -1) do
      delete growing_url(@growing)
    end

    assert_redirected_to growings_url
  end
end
