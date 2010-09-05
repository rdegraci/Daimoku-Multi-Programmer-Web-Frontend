require 'test_helper'

class SimKlassesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sim_klasses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sim_klass" do
    assert_difference('SimKlass.count') do
      post :create, :sim_klass => { }
    end

    assert_redirected_to sim_klass_path(assigns(:sim_klass))
  end

  test "should show sim_klass" do
    get :show, :id => sim_klasses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sim_klasses(:one).to_param
    assert_response :success
  end

  test "should update sim_klass" do
    put :update, :id => sim_klasses(:one).to_param, :sim_klass => { }
    assert_redirected_to sim_klass_path(assigns(:sim_klass))
  end

  test "should destroy sim_klass" do
    assert_difference('SimKlass.count', -1) do
      delete :destroy, :id => sim_klasses(:one).to_param
    end

    assert_redirected_to sim_klasses_path
  end
end
