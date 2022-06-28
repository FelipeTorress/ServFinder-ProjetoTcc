class WelcomeController < ApplicationController
  def index
    redirect_to services_path if user_signed_in?
  end
end
