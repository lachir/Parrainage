require 'test_helper'

class SemainesControllerTest < ActionController::TestCase
  setup do
    @semaine = semaines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:semaines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create semaine" do
    assert_difference('Semaine.count') do
      post :create, semaine: { description: @semaine.description, enddate: @semaine.enddate, nom: @semaine.nom, startdate: @semaine.startdate }
    end

    assert_redirected_to semaine_path(assigns(:semaine))
  end

  test "should show semaine" do
    get :show, id: @semaine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @semaine
    assert_response :success
  end

  test "should update semaine" do
    patch :update, id: @semaine, semaine: { description: @semaine.description, enddate: @semaine.enddate, nom: @semaine.nom, startdate: @semaine.startdate }
    assert_redirected_to semaine_path(assigns(:semaine))
  end

  test "should destroy semaine" do
    assert_difference('Semaine.count', -1) do
      delete :destroy, id: @semaine
    end

    assert_redirected_to semaines_path
  end
end
