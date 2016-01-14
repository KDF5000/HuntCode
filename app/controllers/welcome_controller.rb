class WelcomeController < ApplicationController
  def index
    @user = get_user
    project_dates = Project.select("date(updated_at) as ordered_date").group("created_at, updated_at").order("ordered_date").limit(1)
    # @project_dates = Array.new
    # project_dates.each do |pd|
    #     @project_dates.append(pd[:ordered_date])
    # end
    # if @project_dates.size > 0
    #   @next_date = project_dates.at(0)[:ordered_date]
    # else
    #   @next_date = ''
    # end
    # 怎么判断project_dates获取的个数
    @next_date = project_dates.at(0)[:ordered_date].strftime('%Y-%m-%d')
    render 'index'
  end

  private
    def get_project_info(project)
      project_hash = Hash.new
      project_hash.store('project', project)
      project_hash.store('stars_num', project.stars.count)
      top_stars = project.stars.take(4)
      star_user_list = Array.new
      top_stars.each do |data|
        user_hash = Hash.new
        user_hash.store('user_id', data.user.id)
        user_hash.store('user_avatar',data.user.avatar)
        star_user_list.append(user_hash)
      end
      project_hash.store('star_users', star_user_list)
      return project_hash
    end
end
