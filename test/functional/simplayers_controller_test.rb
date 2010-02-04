require 'test_helper'

class SimplayersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simplayers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simplayer" do
    assert_difference('Simplayer.count') do
      post :create, :simplayer => { }
    end

    assert_redirected_to simplayer_path(assigns(:simplayer))
  end

  test "should show simplayer" do
    get :show, :id => simplayers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => simplayers(:one).to_param
    assert_response :success
  end

  test "should update simplayer" do
    put :update, :id => simplayers(:one).to_param, :simplayer => { }
    assert_redirected_to simplayer_path(assigns(:simplayer))
  end

  test "should destroy simplayer" do
    assert_difference('Simplayer.count', -1) do
      delete :destroy, :id => simplayers(:one).to_param
    end

    assert_redirected_to simplayers_path
  end
end
