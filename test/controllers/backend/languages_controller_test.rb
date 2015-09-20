require 'test_helper'

class Backend::LanguagesControllerTest < ActionController::TestCase
  setup do
    @backend_language = backend_languages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_languages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_language" do
    assert_difference('Backend::Language.count') do
      post :create, backend_language: {  }
    end

    assert_redirected_to backend_language_path(assigns(:backend_language))
  end

  test "should show backend_language" do
    get :show, id: @backend_language
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_language
    assert_response :success
  end

  test "should update backend_language" do
    patch :update, id: @backend_language, backend_language: {  }
    assert_redirected_to backend_language_path(assigns(:backend_language))
  end

  test "should destroy backend_language" do
    assert_difference('Backend::Language.count', -1) do
      delete :destroy, id: @backend_language
    end

    assert_redirected_to backend_languages_path
  end
end
