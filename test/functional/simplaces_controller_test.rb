require 'test_helper'

class SimplacesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simplaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simplace" do
    assert_difference('Simplace.count') do
      post :create, :simplace => { }
    end

    assert_redirected_to simplace_path(assigns(:simplace))
  end

  test "should show simplace" do
    get :show, :id => simplaces(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => simplaces(:one).to_param
    assert_response :success
  end

  test "should update simplace" do
    put :update, :id => simplaces(:one).to_param, :simplace => { }
    assert_redirected_to simplace_path(assigns(:simplace))
  end

  test "should destroy simplace" do
    assert_difference('Simplace.count', -1) do
      delete :destroy, :id => simplaces(:one).to_param
    end

    assert_redirected_to simplaces_path
  end
end
