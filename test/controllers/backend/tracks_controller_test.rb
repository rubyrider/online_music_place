require 'test_helper'

class Backend::TracksControllerTest < ActionController::TestCase
  setup do
    @backend_track = backend_tracks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_tracks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_track" do
    assert_difference('Backend::Track.count') do
      post :create, backend_track: {  }
    end

    assert_redirected_to backend_track_path(assigns(:backend_track))
  end

  test "should show backend_track" do
    get :show, id: @backend_track
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_track
    assert_response :success
  end

  test "should update backend_track" do
    patch :update, id: @backend_track, backend_track: {  }
    assert_redirected_to backend_track_path(assigns(:backend_track))
  end

  test "should destroy backend_track" do
    assert_difference('Backend::Track.count', -1) do
      delete :destroy, id: @backend_track
    end

    assert_redirected_to backend_tracks_path
  end
end
