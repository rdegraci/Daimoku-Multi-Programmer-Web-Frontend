require 'test_helper'

class SimModulesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sim_modules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sim_module" do
    assert_difference('SimModule.count') do
      post :create, :sim_module => { }
    end

    assert_redirected_to sim_module_path(assigns(:sim_module))
  end

  test "should show sim_module" do
    get :show, :id => sim_modules(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sim_modules(:one).to_param
    assert_response :success
  end

  test "should update sim_module" do
    put :update, :id => sim_modules(:one).to_param, :sim_module => { }
    assert_redirected_to sim_module_path(assigns(:sim_module))
  end

  test "should destroy sim_module" do
    assert_difference('SimModule.count', -1) do
      delete :destroy, :id => sim_modules(:one).to_param
    end

    assert_redirected_to sim_modules_path
  end
end
