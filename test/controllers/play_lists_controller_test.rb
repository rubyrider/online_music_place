require 'test_helper'

class PlayListsControllerTest < ActionController::TestCase
  setup do
    @play_list = play_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:play_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create play_list" do
    assert_difference('PlayList.count') do
      post :create, play_list: {  }
    end

    assert_redirected_to play_list_path(assigns(:play_list))
  end

  test "should show play_list" do
    get :show, id: @play_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @play_list
    assert_response :success
  end

  test "should update play_list" do
    patch :update, id: @play_list, play_list: {  }
    assert_redirected_to play_list_path(assigns(:play_list))
  end

  test "should destroy play_list" do
    assert_difference('PlayList.count', -1) do
      delete :destroy, id: @play_list
    end

    assert_redirected_to play_lists_path
  end
end
