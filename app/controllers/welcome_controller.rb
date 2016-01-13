class WelcomeController < ApplicationController
  def index
    @user = get_user
    @project_dates = Project.select("date(created_at) as ordered_date order").group("date(created_at)").order("ordered_date")
    render 'index'
  end
end
