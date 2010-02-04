require 'test_helper'

class SimdownsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simdowns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simdown" do
    assert_difference('Simdown.count') do
      post :create, :simdown => { }
    end

    assert_redirected_to simdown_path(assigns(:simdown))
  end

  test "should show simdown" do
    get :show, :id => simdowns(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => simdowns(:one).to_param
    assert_response :success
  end

  test "should update simdown" do
    put :update, :id => simdowns(:one).to_param, :simdown => { }
    assert_redirected_to simdown_path(assigns(:simdown))
  end

  test "should destroy simdown" do
    assert_difference('Simdown.count', -1) do
      delete :destroy, :id => simdowns(:one).to_param
    end

    assert_redirected_to simdowns_path
  end
end
