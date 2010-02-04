require 'test_helper'

class SimnorthsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simnorths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simnorth" do
    assert_difference('Simnorth.count') do
      post :create, :simnorth => { }
    end

    assert_redirected_to simnorth_path(assigns(:simnorth))
  end

  test "should show simnorth" do
    get :show, :id => simnorths(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => simnorths(:one).to_param
    assert_response :success
  end

  test "should update simnorth" do
    put :update, :id => simnorths(:one).to_param, :simnorth => { }
    assert_redirected_to simnorth_path(assigns(:simnorth))
  end

  test "should destroy simnorth" do
    assert_difference('Simnorth.count', -1) do
      delete :destroy, :id => simnorths(:one).to_param
    end

    assert_redirected_to simnorths_path
  end
end
