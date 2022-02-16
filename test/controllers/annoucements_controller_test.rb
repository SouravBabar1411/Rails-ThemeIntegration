require 'test_helper'

class AnnoucementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @annoucement = annoucements(:one)
  end

  test "should get index" do
    get annoucements_url
    assert_response :success
  end

  test "should get new" do
    get new_annoucement_url
    assert_response :success
  end

  test "should create annoucement" do
    assert_difference('Annoucement.count') do
      post annoucements_url, params: { annoucement: { game: @annoucement.game, message: @annoucement.message } }
    end

    assert_redirected_to annoucement_url(Annoucement.last)
  end

  test "should show annoucement" do
    get annoucement_url(@annoucement)
    assert_response :success
  end

  test "should get edit" do
    get edit_annoucement_url(@annoucement)
    assert_response :success
  end

  test "should update annoucement" do
    patch annoucement_url(@annoucement), params: { annoucement: { game: @annoucement.game, message: @annoucement.message } }
    assert_redirected_to annoucement_url(@annoucement)
  end

  test "should destroy annoucement" do
    assert_difference('Annoucement.count', -1) do
      delete annoucement_url(@annoucement)
    end

    assert_redirected_to annoucements_url
  end
end
