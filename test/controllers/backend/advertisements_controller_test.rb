require 'test_helper'

class Backend::AdvertisementsControllerTest < ActionController::TestCase
  setup do
    @backend_advertisement = backend_advertisements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_advertisements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_advertisement" do
    assert_difference('Backend::Advertisement.count') do
      post :create, backend_advertisement: {  }
    end

    assert_redirected_to backend_advertisement_path(assigns(:backend_advertisement))
  end

  test "should show backend_advertisement" do
    get :show, id: @backend_advertisement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_advertisement
    assert_response :success
  end

  test "should update backend_advertisement" do
    patch :update, id: @backend_advertisement, backend_advertisement: {  }
    assert_redirected_to backend_advertisement_path(assigns(:backend_advertisement))
  end

  test "should destroy backend_advertisement" do
    assert_difference('Backend::Advertisement.count', -1) do
      delete :destroy, id: @backend_advertisement
    end

    assert_redirected_to backend_advertisements_path
  end
end
