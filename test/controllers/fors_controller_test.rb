require 'test_helper'

class ForsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @for = fors(:one)
  end

  test "should get index" do
    get fors_url
    assert_response :success
  end

  test "should get new" do
    get new_for_url
    assert_response :success
  end

  test "should create for" do
    assert_difference('For.count') do
      post fors_url, params: { for: { Developer: @for.Developer, null: @for.null, unique: @for.unique } }
    end

    assert_redirected_to for_url(For.last)
  end

  test "should show for" do
    get for_url(@for)
    assert_response :success
  end

  test "should get edit" do
    get edit_for_url(@for)
    assert_response :success
  end

  test "should update for" do
    patch for_url(@for), params: { for: { Developer: @for.Developer, null: @for.null, unique: @for.unique } }
    assert_redirected_to for_url(@for)
  end

  test "should destroy for" do
    assert_difference('For.count', -1) do
      delete for_url(@for)
    end

    assert_redirected_to fors_url
  end
end
