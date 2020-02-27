# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create]
  before_action :already_login?, only: :new

  def new; end

  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      flash[:success] = "Hi, #{@user.username}, nice to see you again~"
      session[:user_id] = @user.id
      redirect_to backlog_list_path
    else
      flash[:danger] = 'User does not exist or the password is not correct'
      redirect_to '/login'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

  private

  def already_login?
    if logged_in?
      flash[:warning] = 'Alreadt Logged In.'
      redirect_to backlog_list_path
    end
  end
end
