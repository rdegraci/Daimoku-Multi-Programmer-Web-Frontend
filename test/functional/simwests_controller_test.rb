require 'test_helper'

class SimwestsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simwests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simwest" do
    assert_difference('Simwest.count') do
      post :create, :simwest => { }
    end

    assert_redirected_to simwest_path(assigns(:simwest))
  end

  test "should show simwest" do
    get :show, :id => simwests(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => simwests(:one).to_param
    assert_response :success
  end

  test "should update simwest" do
    put :update, :id => simwests(:one).to_param, :simwest => { }
    assert_redirected_to simwest_path(assigns(:simwest))
  end

  test "should destroy simwest" do
    assert_difference('Simwest.count', -1) do
      delete :destroy, :id => simwests(:one).to_param
    end

    assert_redirected_to simwests_path
  end
end
