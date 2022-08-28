class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
        #mudar a quant de servicos
    @services = @user.services.paginate(page: params[:page], per_page: 2)
  end

  def index
    #mudar para usuarios perto
    #mudar a quant de usuarios
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def update
    user = User.find(params[:id])
    user.accepted_cookies = true
    user.save
  end
end
