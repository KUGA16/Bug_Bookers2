class ChatChannel < ApplicationCable::Channel
  #フロントとバックがつながったときに実行するメゾット
  def subscribed
    #stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast 'chat_channel', chat: data['chat']
  end
end
