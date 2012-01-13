require 'test_helper'

class StoryStatusesControllerTest < ActionController::TestCase
  setup do
    @story_status = story_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:story_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create story_status" do
    assert_difference('StoryStatus.count') do
      post :create, :story_status => @story_status.attributes
    end

    assert_redirected_to story_status_path(assigns(:story_status))
  end

  test "should show story_status" do
    get :show, :id => @story_status.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @story_status.to_param
    assert_response :success
  end

  test "should update story_status" do
    put :update, :id => @story_status.to_param, :story_status => @story_status.attributes
    assert_redirected_to story_status_path(assigns(:story_status))
  end

  test "should destroy story_status" do
    assert_difference('StoryStatus.count', -1) do
      delete :destroy, :id => @story_status.to_param
    end

    assert_redirected_to story_statuses_path
  end
end
