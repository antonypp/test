require 'test_helper'

class StoryCommentsControllerTest < ActionController::TestCase
  setup do
    @story_comment = story_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:story_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create story_comment" do
    assert_difference('StoryComment.count') do
      @story_comment.story = stories(:one)
      post :create, :story_comment => @story_comment.attributes
    end

    assert_redirected_to story_comment_path(assigns(:story_comment))
  end

  test "should show story_comment" do
    get :show, :id => @story_comment.to_param
    assert_response :success
  end


  test "should destroy story_comment" do
    assert_difference('StoryComment.count', -1) do
      delete :destroy, :id => @story_comment.to_param
    end

    assert_redirected_to story_comments_path
  end
end
