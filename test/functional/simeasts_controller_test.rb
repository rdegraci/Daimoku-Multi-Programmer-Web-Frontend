require 'test_helper'

class SimeastsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simeasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simeast" do
    assert_difference('Simeast.count') do
      post :create, :simeast => { }
    end

    assert_redirected_to simeast_path(assigns(:simeast))
  end

  test "should show simeast" do
    get :show, :id => simeasts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => simeasts(:one).to_param
    assert_response :success
  end

  test "should update simeast" do
    put :update, :id => simeasts(:one).to_param, :simeast => { }
    assert_redirected_to simeast_path(assigns(:simeast))
  end

  test "should destroy simeast" do
    assert_difference('Simeast.count', -1) do
      delete :destroy, :id => simeasts(:one).to_param
    end

    assert_redirected_to simeasts_path
  end
end
