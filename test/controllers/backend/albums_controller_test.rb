require 'test_helper'

class Backend::AlbumsControllerTest < ActionController::TestCase
  setup do
    @backend_album = backend_albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_albums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_album" do
    assert_difference('Backend::Album.count') do
      post :create, backend_album: {  }
    end

    assert_redirected_to backend_album_path(assigns(:backend_album))
  end

  test "should show backend_album" do
    get :show, id: @backend_album
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_album
    assert_response :success
  end

  test "should update backend_album" do
    patch :update, id: @backend_album, backend_album: {  }
    assert_redirected_to backend_album_path(assigns(:backend_album))
  end

  test "should destroy backend_album" do
    assert_difference('Backend::Album.count', -1) do
      delete :destroy, id: @backend_album
    end

    assert_redirected_to backend_albums_path
  end
end
