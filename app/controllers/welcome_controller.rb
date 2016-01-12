class WelcomeController < ApplicationController
  def index
    if cookies[:remember_token] == nil
        print "no user"
        @user = nil
    else
        print "has user"
        @user = current_user
    end
    render 'index'
  end
end
