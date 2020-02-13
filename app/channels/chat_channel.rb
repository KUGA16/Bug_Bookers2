class ChatChannel < ApplicationCable::Channel
#バックエンド側
  def subscribed
    # stream_from "some_channel"
    # フロントとバックが接続された時
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # フロントとバックが切断された時
  end

  def speak(message)
    chat = Chat.new(message: message['message'][0], user_id: message['message'][1].to_i, room_id: message['message'][2].to_i)
    chat.save
    ActionCable.server.broadcast 'chat_channel', message: message['message'][0] # フロントへ返します
  end
end
