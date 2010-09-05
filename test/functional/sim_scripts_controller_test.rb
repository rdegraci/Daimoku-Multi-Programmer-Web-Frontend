require 'test_helper'

class SimScriptsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sim_scripts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sim_script" do
    assert_difference('SimScript.count') do
      post :create, :sim_script => { }
    end

    assert_redirected_to sim_script_path(assigns(:sim_script))
  end

  test "should show sim_script" do
    get :show, :id => sim_scripts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sim_scripts(:one).to_param
    assert_response :success
  end

  test "should update sim_script" do
    put :update, :id => sim_scripts(:one).to_param, :sim_script => { }
    assert_redirected_to sim_script_path(assigns(:sim_script))
  end

  test "should destroy sim_script" do
    assert_difference('SimScript.count', -1) do
      delete :destroy, :id => sim_scripts(:one).to_param
    end

    assert_redirected_to sim_scripts_path
  end
end
