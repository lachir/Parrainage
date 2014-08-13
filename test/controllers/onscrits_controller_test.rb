require 'test_helper'

class OnscritsControllerTest < ActionController::TestCase
  setup do
    @onscrit = onscrits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:onscrits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create onscrit" do
    assert_difference('Onscrit.count') do
      post :create, onscrit: { naissance: @onscrit.naissance, nom: @onscrit.nom, prenom: @onscrit.prenom, prepa_id: @onscrit.prepa_id }
    end

    assert_redirected_to onscrit_path(assigns(:onscrit))
  end

  test "should show onscrit" do
    get :show, id: @onscrit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @onscrit
    assert_response :success
  end

  test "should update onscrit" do
    patch :update, id: @onscrit, onscrit: { naissance: @onscrit.naissance, nom: @onscrit.nom, prenom: @onscrit.prenom, prepa_id: @onscrit.prepa_id }
    assert_redirected_to onscrit_path(assigns(:onscrit))
  end

  test "should destroy onscrit" do
    assert_difference('Onscrit.count', -1) do
      delete :destroy, id: @onscrit
    end

    assert_redirected_to onscrits_path
  end
end
