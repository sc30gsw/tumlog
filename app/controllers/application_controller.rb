class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: 
  before_action :authenticate_user!, except: :index

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile])
  end
end
