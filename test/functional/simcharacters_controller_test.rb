require 'test_helper'

class SimcharactersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simcharacters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simcharacter" do
    assert_difference('Simcharacter.count') do
      post :create, :simcharacter => { }
    end

    assert_redirected_to simcharacter_path(assigns(:simcharacter))
  end

  test "should show simcharacter" do
    get :show, :id => simcharacters(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => simcharacters(:one).to_param
    assert_response :success
  end

  test "should update simcharacter" do
    put :update, :id => simcharacters(:one).to_param, :simcharacter => { }
    assert_redirected_to simcharacter_path(assigns(:simcharacter))
  end

  test "should destroy simcharacter" do
    assert_difference('Simcharacter.count', -1) do
      delete :destroy, :id => simcharacters(:one).to_param
    end

    assert_redirected_to simcharacters_path
  end
end
