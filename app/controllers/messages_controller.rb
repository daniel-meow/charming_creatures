class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @message.save
    if @chatroom.user == current_user
      redirect_to club_path(@chatroom.club, anchor: "message-#{@message.id}")
    else
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content)
  end
  
end