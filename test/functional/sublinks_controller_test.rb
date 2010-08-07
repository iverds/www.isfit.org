require 'test_helper'

class SublinksControllerTest < ActionController::TestCase
  setup do
    @sublink = sublinks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sublinks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sublink" do
    assert_difference('Sublink.count') do
      post :create, :sublink => @sublink.attributes
    end

    assert_redirected_to sublink_path(assigns(:sublink))
  end

  test "should show sublink" do
    get :show, :id => @sublink.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sublink.to_param
    assert_response :success
  end

  test "should update sublink" do
    put :update, :id => @sublink.to_param, :sublink => @sublink.attributes
    assert_redirected_to sublink_path(assigns(:sublink))
  end

  test "should destroy sublink" do
    assert_difference('Sublink.count', -1) do
      delete :destroy, :id => @sublink.to_param
    end

    assert_redirected_to sublinks_path
  end
end
