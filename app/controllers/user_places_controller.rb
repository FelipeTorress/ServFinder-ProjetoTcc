class UserPlacesController < ApplicationController
  before_action :authenticate_user!

  def create
    user_geocode = UserPlace.find_by(user: current_user)
    unless user_geocode
      user_geocode = UserPlace.new
      user_geocode.user = current_user
    end
    user_geocode.place = extract_info_location(user_location(user_lat_and_long).data)
    user_geocode.save
    redirect_to users_path
  end

  def extract_info_location(location, place = nil)
    place ||= Place.new
    place.latitude = location['lat']
    place.longitude = location['lon']
    place.address = location['address']['suburb']
    place.city = location['address']['city']
    place.state = location['address']['state']
    place.state_code = location['address']['state_code']
    place.postal_code = location['address']['postcode']
    place.country = location['address']['country']
    place.country_code = location['address']['country_code']
    place.save ? place : nil
  end

  def update
    user_geocode = UserPlace.find_by(user: current_user)
    user_geocode.place = extract_info_location(user_location(user_lat_and_long).data, user_geocode.place)
    user_geocode.save
    redirect_to users_path
  end

  def destroy
    user_place = UserPlace.find(params[:id])
    place = Place.find(user_place.place.id)
    user_place.destroy
    place.destroy
    redirect_to users_path
  end

  private

  def user_id
    params.require(:user_place).permit(:id)[:id]
  end

  def user_lat_and_long
    params.require(:user_place).permit(:lat_lon)[:lat_lon]
  end
end
