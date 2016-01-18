require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'save info' do
    comment = Comment.new
    comment.user_id = 1
    comment.project_id = 1
    comment.content = "很棒的项目"
    assert comment.save
  end
end
