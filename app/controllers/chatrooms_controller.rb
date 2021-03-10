class ChatroomsController < ApplicationController
  def index
    @chatrooms = current_user.chatrooms_for_clubs
  end
  def show
    @chatrooms = current_user.chatrooms_for_clubs
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
