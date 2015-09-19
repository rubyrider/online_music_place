require 'test_helper'

class Backend::SongsControllerTest < ActionController::TestCase
  setup do
    @backend_song = backend_songs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_songs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_song" do
    assert_difference('Backend::Song.count') do
      post :create, backend_song: {  }
    end

    assert_redirected_to backend_song_path(assigns(:backend_song))
  end

  test "should show backend_song" do
    get :show, id: @backend_song
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_song
    assert_response :success
  end

  test "should update backend_song" do
    patch :update, id: @backend_song, backend_song: {  }
    assert_redirected_to backend_song_path(assigns(:backend_song))
  end

  test "should destroy backend_song" do
    assert_difference('Backend::Song.count', -1) do
      delete :destroy, id: @backend_song
    end

    assert_redirected_to backend_songs_path
  end
end
