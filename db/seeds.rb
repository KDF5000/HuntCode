# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

projects = [{:title=>"pycharm",:intro_content=>"python ide",:users_id =>1 ,:source_url=>"https://www.jetbrains.com/pycharm/download/"},
            {:title=>"rubymine",:intro_content=>"ruby ide",:users_id=>2,:source_url=>"https://www.jetbrains.com/ruby/"}]

# users = [{:x_id=>"123456", :x_username=>"jinjay",:x_passwd=>"123456",:x_email=>"jinjay@qq.com",:x_projects_id=>1},
#          {:x_id=>"123457", :x_username=>"qy",:x_passwd=>"123456",:x_email=>"qy@qq.com",:x_projects_id=>2}]

projects.each do |project|
  Project.create!(project)
end

# users.each do |user|
#   User.create!(user)
# end