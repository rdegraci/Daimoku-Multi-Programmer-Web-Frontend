require 'test_helper'

class SimmapsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simmaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simmap" do
    assert_difference('Simmap.count') do
      post :create, :simmap => { }
    end

    assert_redirected_to simmap_path(assigns(:simmap))
  end

  test "should show simmap" do
    get :show, :id => simmaps(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => simmaps(:one).to_param
    assert_response :success
  end

  test "should update simmap" do
    put :update, :id => simmaps(:one).to_param, :simmap => { }
    assert_redirected_to simmap_path(assigns(:simmap))
  end

  test "should destroy simmap" do
    assert_difference('Simmap.count', -1) do
      delete :destroy, :id => simmaps(:one).to_param
    end

    assert_redirected_to simmaps_path
  end
end
