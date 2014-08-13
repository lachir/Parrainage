require 'test_helper'

class ManipsControllerTest < ActionController::TestCase
  setup do
    @manip = manips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manip" do
    assert_difference('Manip.count') do
      post :create, manip: { lieu: @manip.lieu, nom: @manip.nom }
    end

    assert_redirected_to manip_path(assigns(:manip))
  end

  test "should show manip" do
    get :show, id: @manip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manip
    assert_response :success
  end

  test "should update manip" do
    patch :update, id: @manip, manip: { lieu: @manip.lieu, nom: @manip.nom }
    assert_redirected_to manip_path(assigns(:manip))
  end

  test "should destroy manip" do
    assert_difference('Manip.count', -1) do
      delete :destroy, id: @manip
    end

    assert_redirected_to manips_path
  end
end
