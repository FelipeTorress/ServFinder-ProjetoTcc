class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    #mudar para usuarios perto
    @users = User.all
  end
end
