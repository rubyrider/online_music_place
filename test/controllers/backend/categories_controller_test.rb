require 'test_helper'

class Backend::CategoriesControllerTest < ActionController::TestCase
  setup do
    @backend_category = backend_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_category" do
    assert_difference('Backend::Category.count') do
      post :create, backend_category: {  }
    end

    assert_redirected_to backend_category_path(assigns(:backend_category))
  end

  test "should show backend_category" do
    get :show, id: @backend_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_category
    assert_response :success
  end

  test "should update backend_category" do
    patch :update, id: @backend_category, backend_category: {  }
    assert_redirected_to backend_category_path(assigns(:backend_category))
  end

  test "should destroy backend_category" do
    assert_difference('Backend::Category.count', -1) do
      delete :destroy, id: @backend_category
    end

    assert_redirected_to backend_categories_path
  end
end
