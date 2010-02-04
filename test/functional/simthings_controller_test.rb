require 'test_helper'

class SimthingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simthings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simthing" do
    assert_difference('Simthing.count') do
      post :create, :simthing => { }
    end

    assert_redirected_to simthing_path(assigns(:simthing))
  end

  test "should show simthing" do
    get :show, :id => simthings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => simthings(:one).to_param
    assert_response :success
  end

  test "should update simthing" do
    put :update, :id => simthings(:one).to_param, :simthing => { }
    assert_redirected_to simthing_path(assigns(:simthing))
  end

  test "should destroy simthing" do
    assert_difference('Simthing.count', -1) do
      delete :destroy, :id => simthings(:one).to_param
    end

    assert_redirected_to simthings_path
  end
end
