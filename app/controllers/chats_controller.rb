class ChatsController < ApplicationController
  def show
    @chat = Chat.new
    @chats = Chat.all
    # @room = Room.find(params[:id])
    # @chats = @room.chats
  end

  def create
    @chat = Chat.new(chat_params)
    respond_to do |format|
    if @chat.save!
      format.js
    end
  end
  end

  private def chat_params
  	params.require(:chat).permit(:content)
  end


end
