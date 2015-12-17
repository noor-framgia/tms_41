class Trainee::UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :destroy]

  def index
    @users = User.trainee
  end

  def new
  end

  def show
    @trainee_task_activities_create = PublicActivity::Activity.order("created_at desc").
      where(key:["user_task.create"], owner_id: current_user.id)
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