# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

projects = [{:title=>"pycharm",:intro_content=>"python ide",:user_id =>1 ,:source_url=>"https://www.jetbrains.com/pycharm/download/"},
            {:title=>"rubymine",:intro_content=>"ruby ide",:user_id=>2,:source_url=>"https://www.jetbrains.com/ruby/"}]

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
# users.each do |user|
#   User.create!(user)
# end