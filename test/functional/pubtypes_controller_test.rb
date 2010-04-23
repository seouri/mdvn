require 'test_helper'

class PubtypesControllerTest < ActionController::TestCase
  setup do
    @pubtype = pubtypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pubtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pubtype" do
    assert_difference('Pubtype.count') do
      post :create, :pubtype => @pubtype.attributes
    end

    assert_redirected_to pubtype_path(assigns(:pubtype))
  end

  test "should show pubtype" do
    get :show, :id => @pubtype.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pubtype.to_param
    assert_response :success
  end

  test "should update pubtype" do
    put :update, :id => @pubtype.to_param, :pubtype => @pubtype.attributes
    assert_redirected_to pubtype_path(assigns(:pubtype))
  end

  test "should destroy pubtype" do
    assert_difference('Pubtype.count', -1) do
      delete :destroy, :id => @pubtype.to_param
    end

    assert_redirected_to pubtypes_path
  end
end
