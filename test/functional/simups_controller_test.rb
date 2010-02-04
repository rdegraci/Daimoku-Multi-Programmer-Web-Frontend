require 'test_helper'

class SimupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simup" do
    assert_difference('Simup.count') do
      post :create, :simup => { }
    end

    assert_redirected_to simup_path(assigns(:simup))
  end

  test "should show simup" do
    get :show, :id => simups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => simups(:one).to_param
    assert_response :success
  end

  test "should update simup" do
    put :update, :id => simups(:one).to_param, :simup => { }
    assert_redirected_to simup_path(assigns(:simup))
  end

  test "should destroy simup" do
    assert_difference('Simup.count', -1) do
      delete :destroy, :id => simups(:one).to_param
    end

    assert_redirected_to simups_path
  end
end
