# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(username: user_params[:username], password: user_params[:password], password_confirmation: user_params[:password_confirm])
    if @user.save
      flash[:success] = 'Created an account welcome to use our product.'
      session[:user_id] = @user.id
      redirect_to backlog_list_path
    else
      flash[:danger] = @user.errors.full_messages.join('<br/>')
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirm)
  end
end
