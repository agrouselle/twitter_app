class UsersController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to login_path, :notice => "You successfully signed up. Please log in."
    else
      render "new"
    end
  end
end
