require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:projects_1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  #
  test "should create project without login" do
      post :create, project: { user_id: '1', title: @project.title, language: @project.language, intro_content: @project.intro_content, source_url: @project.source_url }
      # assert_redirected_to project_path(1)
      assert_redirected_to '/loginReg' #没有登陆
  end

  #   assert_redirected_to project_path(assigns(:project))
  # end
  #
  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

end
