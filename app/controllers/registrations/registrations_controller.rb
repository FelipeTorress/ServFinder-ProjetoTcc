# frozen_string_literal: true

class Registrations::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # captcha
  # def create
  #   byebug
  #   success = verify_recaptcha(action: 'login', minimum_score: 0.5, secret_key: Rails.application.credentials.recap_pri_key)
  #   checkbox_success = verify_recaptcha unless success
  #   if success || checkbox_success
  #     super
  #   else
  #     if !success
  #       @show_checkbox_recaptcha = true
  #     end
  #     render 'new'
  #   end
  # end

  # <% if @show_checkbox_recaptcha %>
  #   <%= recaptcha_tags %>
  # <% else %>
  #   <%= recaptcha_v3(action: 'login', site_key: Rails.application.credentials.recap_pub_key) %>
  # <% end %>

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
