require 'test_helper'

class SimpeopleControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simpeople)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simperson" do
    assert_difference('Simperson.count') do
      post :create, :simperson => { }
    end

    assert_redirected_to simperson_path(assigns(:simperson))
  end

  test "should show simperson" do
    get :show, :id => simpeople(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => simpeople(:one).to_param
    assert_response :success
  end

  test "should update simperson" do
    put :update, :id => simpeople(:one).to_param, :simperson => { }
    assert_redirected_to simperson_path(assigns(:simperson))
  end

  test "should destroy simperson" do
    assert_difference('Simperson.count', -1) do
      delete :destroy, :id => simpeople(:one).to_param
    end

    assert_redirected_to simpeople_path
  end
end
