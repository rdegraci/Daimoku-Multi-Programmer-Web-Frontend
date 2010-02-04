require 'test_helper'

class SimkeysControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simkeys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simkey" do
    assert_difference('Simkey.count') do
      post :create, :simkey => { }
    end

    assert_redirected_to simkey_path(assigns(:simkey))
  end

  test "should show simkey" do
    get :show, :id => simkeys(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => simkeys(:one).to_param
    assert_response :success
  end

  test "should update simkey" do
    put :update, :id => simkeys(:one).to_param, :simkey => { }
    assert_redirected_to simkey_path(assigns(:simkey))
  end

  test "should destroy simkey" do
    assert_difference('Simkey.count', -1) do
      delete :destroy, :id => simkeys(:one).to_param
    end

    assert_redirected_to simkeys_path
  end
end
