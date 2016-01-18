require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'save without info' do
    project = Project.new
    assert_not project.save
  end

  test 'save project' do
    project = Project.new
    project.id = 12
    project.title =  "OpenAuth.Net"
    project.language = "java"
    project.intro_content = "项目采用经典DDD架构(用沃恩.弗农大神的话，其实这是DDD-Lite）思想进行开发，简洁而不简单，实用至上，并且所写每一行代码都经过深思熟虑，符合SOLID规则！"
    project.user_id = 1
    project.source_url = "http://git.oschina.net/yubaolee/OpenAuth.Net"
    assert project.save
  end
end
