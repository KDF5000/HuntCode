class WelcomeController < ApplicationController
  def index
    @user = get_user
    @projects = Project.all
    render 'index'
  end
end
