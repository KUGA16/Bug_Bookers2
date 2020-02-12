class ChatChannel < ApplicationCable::Channel
  def subscribed #クライアントと接続されたとき
    # stream_from "some_channel"
  end

  def unsubscribed #接続が解除されたとき
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
  end
end
