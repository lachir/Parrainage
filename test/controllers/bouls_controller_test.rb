require 'test_helper'

class BoulsControllerTest < ActionController::TestCase
  setup do
    @boul = bouls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bouls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boul" do
    assert_difference('Boul.count') do
      post :create, boul: { nom: @boul.nom }
    end

    assert_redirected_to boul_path(assigns(:boul))
  end

  test "should show boul" do
    get :show, id: @boul
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boul
    assert_response :success
  end

  test "should update boul" do
    patch :update, id: @boul, boul: { nom: @boul.nom }
    assert_redirected_to boul_path(assigns(:boul))
  end

  test "should destroy boul" do
    assert_difference('Boul.count', -1) do
      delete :destroy, id: @boul
    end

    assert_redirected_to bouls_path
  end
end
