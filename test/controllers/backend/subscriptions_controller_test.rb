require 'test_helper'

class Backend::SubscriptionsControllerTest < ActionController::TestCase
  setup do
    @backend_subscription = backend_subscriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_subscription" do
    assert_difference('Backend::Subscription.count') do
      post :create, backend_subscription: {  }
    end

    assert_redirected_to backend_subscription_path(assigns(:backend_subscription))
  end

  test "should show backend_subscription" do
    get :show, id: @backend_subscription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_subscription
    assert_response :success
  end

  test "should update backend_subscription" do
    patch :update, id: @backend_subscription, backend_subscription: {  }
    assert_redirected_to backend_subscription_path(assigns(:backend_subscription))
  end

  test "should destroy backend_subscription" do
    assert_difference('Backend::Subscription.count', -1) do
      delete :destroy, id: @backend_subscription
    end

    assert_redirected_to backend_subscriptions_path
  end
end
