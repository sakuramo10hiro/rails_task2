class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path
    else
    render "show"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_introduction, :user_image)
  end
end
