class TeachersController < ApplicationController

  def index
    @teacher = current_user
  end


  def profile
    @teacher = current_user

    if User.find_by_username(params[:id])
      @username = params[:id]
      @user = User.find_by_username(params[:id])
    else
      redirect_to pins_path
    end

  end

  def calendar
    @teacher = current_user

    if User.find_by_username(params[:id])
      @username = params[:id]
      @user = User.find_by_username(params[:id])
    else
      redirect_to pins_path
    end
  end




end