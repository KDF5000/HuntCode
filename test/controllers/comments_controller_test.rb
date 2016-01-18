require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:comment_1)
  end

  # test "should create comment" do
  #   post project_comments_path(1), comment: { content: @comment.content, project_id: @comment.project_id, user_id: @comment.user_id }
  #   # assert_redirected_to project_path(@comment.project_id)
  # end

end
