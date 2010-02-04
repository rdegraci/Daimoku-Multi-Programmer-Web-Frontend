require 'test_helper'

class SimdoorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simdoors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simdoor" do
    assert_difference('Simdoor.count') do
      post :create, :simdoor => { }
    end

    assert_redirected_to simdoor_path(assigns(:simdoor))
  end

  test "should show simdoor" do
    get :show, :id => simdoors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => simdoors(:one).to_param
    assert_response :success
  end

  test "should update simdoor" do
    put :update, :id => simdoors(:one).to_param, :simdoor => { }
    assert_redirected_to simdoor_path(assigns(:simdoor))
  end

  test "should destroy simdoor" do
    assert_difference('Simdoor.count', -1) do
      delete :destroy, :id => simdoors(:one).to_param
    end

    assert_redirected_to simdoors_path
  end
end
