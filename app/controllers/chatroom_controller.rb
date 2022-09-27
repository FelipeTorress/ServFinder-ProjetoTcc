class ChatroomController < ApplicationController
  def index
    users = params[:format].split(',').map{|value| value.to_i}
    @contratante = User.where(id: users.first).first
    chat_id = params[:format].remove(',').to_i
    @message = Message.new
    @chat_id = chat_id
    @messages = Message.where(chat_id: chat_id).order('created_at ASC')

    user_location = UserPlace.find_by(user: @contratante)
    return unless user_location

    @place = Place.find(user_location.place.id)
  end
end
