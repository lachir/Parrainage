require 'test_helper'

class PrepasControllerTest < ActionController::TestCase
  setup do
    @prepa = prepas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prepas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prepa" do
    assert_difference('Prepa.count') do
      post :create, prepa: { nom: @prepa.nom, ville: @prepa.ville }
    end

    assert_redirected_to prepa_path(assigns(:prepa))
  end

  test "should show prepa" do
    get :show, id: @prepa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prepa
    assert_response :success
  end

  test "should update prepa" do
    patch :update, id: @prepa, prepa: { nom: @prepa.nom, ville: @prepa.ville }
    assert_redirected_to prepa_path(assigns(:prepa))
  end

  test "should destroy prepa" do
    assert_difference('Prepa.count', -1) do
      delete :destroy, id: @prepa
    end

    assert_redirected_to prepas_path
  end
end
