class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication
  before_filter :check_supervisor, only: [:new, :create]

  def new
    super
  end

  def create
    super
  end

  private
  def sign_up_params
    params.require(:user).permit :name, :email, :password, :password_confirmation,
      :role
  end

  def account_update_params
    params.require(:user).permit :first_name, :last_name, :email, :password,
      :password_confirmation, :current_password
  end

  def check_supervisor
    if user_signed_in? && !current_user.supervisor?
      redirect_to root_url
    else
      true
    end
  end
end