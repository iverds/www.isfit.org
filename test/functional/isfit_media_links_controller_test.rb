require 'test_helper'

class IsfitMediaLinksControllerTest < ActionController::TestCase
  setup do
    @isfit_media_link = isfit_media_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:isfit_media_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create isfit_media_link" do
    assert_difference('IsfitMediaLink.count') do
      post :create, :isfit_media_link => @isfit_media_link.attributes
    end

    assert_redirected_to isfit_media_link_path(assigns(:isfit_media_link))
  end

  test "should show isfit_media_link" do
    get :show, :id => @isfit_media_link.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @isfit_media_link.to_param
    assert_response :success
  end

  test "should update isfit_media_link" do
    put :update, :id => @isfit_media_link.to_param, :isfit_media_link => @isfit_media_link.attributes
    assert_redirected_to isfit_media_link_path(assigns(:isfit_media_link))
  end

  test "should destroy isfit_media_link" do
    assert_difference('IsfitMediaLink.count', -1) do
      delete :destroy, :id => @isfit_media_link.to_param
    end

    assert_redirected_to isfit_media_links_path
  end
end
