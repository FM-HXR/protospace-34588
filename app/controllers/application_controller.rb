class ApplicationController < ActionController::Base
  before_action :config_permitted_params, if: :devise_controller?
  # before_action :authenticate_user!
  before_action :find_user

  def config_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end

  def find_user
    @user = current_user 
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end  
  end

end
