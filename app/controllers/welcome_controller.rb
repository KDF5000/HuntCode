class WelcomeController < ApplicationController
  def index
    @user = get_user
    project_dates = Project.select("date(created_at) as ordered_date").group("date(created_at)").order("ordered_date")
    @projects = Project.all
    @project_dates = Array.new
    project_dates.each do |pd|
        @project_dates.append(pd[:ordered_date])
    end
    render 'index'
  end
end
