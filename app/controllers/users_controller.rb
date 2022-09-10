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
    @user_geocode = UserPlace.find_by(user: current_user)

    return unless @user_geocode

    @user_place = Place.find(@user_geocode.place.id)
    place = Place.find(@user_geocode.place.id)
    places_near = Place.near([place.latitude, place.longitude], 10, units: :km).map(&:id)
    places_near.delete(@user_place.id)
    users_near = UserPlace.where(place: places_near).map(&:user_id)
    @users = User.where(id: users_near, isContratante: !current_user.isContratante).paginate(page: params[:page], per_page: 2)
  end

  def update
    user = User.find(params[:id])
    user.accepted_cookies = true
    user.save
  end
end
