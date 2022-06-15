class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :permit_phone_number, :permit_email, :accepted_terms_of_use, :accepted_privacy_policy])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number, :permit_phone_number,:permit_email, :accepted_terms_of_use, :accepted_privacy_policy])
  end
end
