require 'test_helper'

class MusicalBandsControllerTest < ActionController::TestCase
  setup do
    @musical_band = musical_bands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:musical_bands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create musical_band" do
    assert_difference('MusicalBand.count') do
      post :create, musical_band: {  }
    end

    assert_redirected_to musical_band_path(assigns(:musical_band))
  end

  test "should show musical_band" do
    get :show, id: @musical_band
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @musical_band
    assert_response :success
  end

  test "should update musical_band" do
    patch :update, id: @musical_band, musical_band: {  }
    assert_redirected_to musical_band_path(assigns(:musical_band))
  end

  test "should destroy musical_band" do
    assert_difference('MusicalBand.count', -1) do
      delete :destroy, id: @musical_band
    end

    assert_redirected_to musical_bands_path
  end
end
