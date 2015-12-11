class Trainee::UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :destroy]

  def index
    @users = User.trainee
  end

  def new
  end

  def show
  end

  def edit
  end

  def destroy
    if @user.destroy
      flash[:success] = t(:success_message_delete_trainee)
      redirect_to trainee_users_path
    end
  end

  private
  def load_user
    @user = User.find params[:id]
  end
end