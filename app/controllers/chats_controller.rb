class ChatsController < ApplicationController
  def show
    @chats = Chat.all
  end

  def create
  end

  private
  def chat_params
  	params.require(:chat).permit(:content)
  end


end
