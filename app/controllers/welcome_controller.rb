class WelcomeController < ApplicationController
  def index
    if cookies[:remember_token] == nil
        @user = nil
    else
        @user = current_user
    end
    render 'index'
  end
end
