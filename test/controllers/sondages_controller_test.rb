require 'test_helper'

class SondagesControllerTest < ActionController::TestCase
  setup do
    @sondage = sondages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sondages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sondage" do
    assert_difference('Sondage.count') do
      post :create, sondage: { description: @sondage.description, enddate: @sondage.enddate, nbchoix: @sondage.nbchoix, nom: @sondage.nom, startdate: @sondage.startdate }
    end

    assert_redirected_to sondage_path(assigns(:sondage))
  end

  test "should show sondage" do
    get :show, id: @sondage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sondage
    assert_response :success
  end

  test "should update sondage" do
    patch :update, id: @sondage, sondage: { description: @sondage.description, enddate: @sondage.enddate, nbchoix: @sondage.nbchoix, nom: @sondage.nom, startdate: @sondage.startdate }
    assert_redirected_to sondage_path(assigns(:sondage))
  end

  test "should destroy sondage" do
    assert_difference('Sondage.count', -1) do
      delete :destroy, id: @sondage
    end

    assert_redirected_to sondages_path
  end
end
