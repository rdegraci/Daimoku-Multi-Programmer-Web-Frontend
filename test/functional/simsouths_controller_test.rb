require 'test_helper'

class SimsouthsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simsouths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simsouth" do
    assert_difference('Simsouth.count') do
      post :create, :simsouth => { }
    end

    assert_redirected_to simsouth_path(assigns(:simsouth))
  end

  test "should show simsouth" do
    get :show, :id => simsouths(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => simsouths(:one).to_param
    assert_response :success
  end

  test "should update simsouth" do
    put :update, :id => simsouths(:one).to_param, :simsouth => { }
    assert_redirected_to simsouth_path(assigns(:simsouth))
  end

  test "should destroy simsouth" do
    assert_difference('Simsouth.count', -1) do
      delete :destroy, :id => simsouths(:one).to_param
    end

    assert_redirected_to simsouths_path
  end
end
