require 'test_helper'

class SimVariablesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sim_variables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sim_variable" do
    assert_difference('SimVariable.count') do
      post :create, :sim_variable => { }
    end

    assert_redirected_to sim_variable_path(assigns(:sim_variable))
  end

  test "should show sim_variable" do
    get :show, :id => sim_variables(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sim_variables(:one).to_param
    assert_response :success
  end

  test "should update sim_variable" do
    put :update, :id => sim_variables(:one).to_param, :sim_variable => { }
    assert_redirected_to sim_variable_path(assigns(:sim_variable))
  end

  test "should destroy sim_variable" do
    assert_difference('SimVariable.count', -1) do
      delete :destroy, :id => sim_variables(:one).to_param
    end

    assert_redirected_to sim_variables_path
  end
end
