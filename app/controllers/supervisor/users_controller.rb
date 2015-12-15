class Supervisor::UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :destroy]
  authorize_resource

  def index
    @users = User.supervisor
  end

  def new
  end

  def show
  end

  def edit
  end

  def destroy
   if @user.destroy
     flash[:success] = t(:success_message_delete)
     redirect_to supervisor_users_path
   end
  end

  private
    def load_user
      @user = User.find params[:id]
    end
end