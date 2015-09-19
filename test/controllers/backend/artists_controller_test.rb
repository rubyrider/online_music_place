require 'test_helper'

class Backend::ArtistsControllerTest < ActionController::TestCase
  setup do
    @backend_artist = backend_artists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_artists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_artist" do
    assert_difference('Backend::Artist.count') do
      post :create, backend_artist: {  }
    end

    assert_redirected_to backend_artist_path(assigns(:backend_artist))
  end

  test "should show backend_artist" do
    get :show, id: @backend_artist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_artist
    assert_response :success
  end

  test "should update backend_artist" do
    patch :update, id: @backend_artist, backend_artist: {  }
    assert_redirected_to backend_artist_path(assigns(:backend_artist))
  end

  test "should destroy backend_artist" do
    assert_difference('Backend::Artist.count', -1) do
      delete :destroy, id: @backend_artist
    end

    assert_redirected_to backend_artists_path
  end
end
