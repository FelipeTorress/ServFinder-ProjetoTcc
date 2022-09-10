class ChatroomController < ApplicationController
  def index
    @message = Message.new
    @chat_id = params[:format].to_i
    @messages = Message.where(chat_id: params[:format].to_i).order('created_at ASC')
  end
end
