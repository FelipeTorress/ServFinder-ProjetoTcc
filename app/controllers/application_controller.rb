class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def user_location(lat_lon = "")
    if params[:location].blank?
      if Rails.env.test? || Rails.env.development?
        @location ||= if lat_lon.blank?
                        Geocoder.search(['-5.126415', '-42.789010']).first
                      else
                        Geocoder.search(lat_lon).first
                      end
      else
        @location ||= if lat_lon.blank?
                        request.location
                      else
                        Geocoder.search(lat_lon).first
                      end
      end
    else
      params[:location].each { |l| l = l.to_i } if params[:location].is_a? Array
      @location ||= Geocoder.search(params[:location]).first
      @location
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :permit_phone_number, :permit_email, :accepted_terms_of_use, :accepted_privacy_policy, :address, :isContratante])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number, :permit_phone_number,:permit_email, :accepted_terms_of_use, :accepted_privacy_policy, :address, :isContratante])
  end
end
