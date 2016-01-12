require 'test_helper'

class ThirdpartiesControllerTest < ActionController::TestCase
  setup do
    @thirdparty = thirdparties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thirdparties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thirdparty" do
    assert_difference('Thirdparty.count') do
      post :create, thirdparty: { identifier: @thirdparty.identifier, user_id: @thirdparty.user_id }
    end

    assert_redirected_to thirdparty_path(assigns(:thirdparty))
  end

  test "should show thirdparty" do
    get :show, id: @thirdparty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @thirdparty
    assert_response :success
  end

  test "should update thirdparty" do
    patch :update, id: @thirdparty, thirdparty: { identifier: @thirdparty.identifier, user_id: @thirdparty.user_id }
    assert_redirected_to thirdparty_path(assigns(:thirdparty))
  end

  test "should destroy thirdparty" do
    assert_difference('Thirdparty.count', -1) do
      delete :destroy, id: @thirdparty
    end

    assert_redirected_to thirdparties_path
  end
end
