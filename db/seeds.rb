# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

projects = [{:title=>"pycharm",:intro_content=>"python ide",:language=>"Python", :user_id =>1 ,:source_url=>"https://www.jetbrains.com/pycharm/download/"},
            {:title=>"rubymine",:intro_content=>"ruby ide",:language=>"Ruby", :user_id=>2,:source_url=>"https://www.jetbrains.com/ruby/"},
            {:title=>"Redis的可视化工具 Medis ",:language=>"nodejs", :intro_content=>"Medis 是 Mac 系统上一个一款界面很漂亮，而且易于使用的 Redis 数据库管理工具。基于 Electron, React, 和 Redux 平台构建，由很多很棒的 Node.js 模块所组成，特别是 ioredis 和 ssh2.",:user_id=>2,:source_url=>"https://github.com/luin/medis"},
            {:title=>"DebOps",:language=>"Python",:intro_content=>"DebOps基于Debian的数据中心，是Ansible方案的集合，可以任意从一个容器伸缩到整个条目数据中心",:user_id=>1,:source_url=>"https://github.com/debops/debops"},
            {:title=>"Docker",:language=>"Go", :intro_content=>"Docker是一个开源的应用容器引擎，让开发者可以打包其应用以及依赖包到一个可移植的容器中，然后发布到任意Linux发行版，也可实现虚拟化",:user_id=>1,:source_url=>"https://www.docker.io"},
            {:title=>"InfluxDB",:language=>"Go",:intro_content=>"InfluxDB是一个开源分布式的时序、事件和指标数据库。InfluxDB使用Go语音编写，无需外部依赖。其设计目标是实现分布式和水平伸缩扩展。",:user_id=>2,:source_url=>"http://influxdb.org/"},]

 # users = [{:x_username=>"jinjay",:x_passwd=>"123456",:x_email=>"jinjay@qq.com",:x_projects_id=>1},
 #         {:x_username=>"qy",:x_passwd=>"123456",:x_email=>"qy@qq.com",:x_projects_id=>2}]

users = [{:x_username=>"admin",:x_email=>"admin@123.com",:password=> "123456",:password_confirmation=>"123456",:admin=>true}]
stars = [{:user_id=>1,:project_id=>1},{:user_id=>2,:project_id=>2}]

projects.each do |project|
  Project.create!(project)
end

stars.each do |star|
  Star.create!(star)
end
users.each do |user|
  User.create!(user)
end