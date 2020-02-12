App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    #接続の繋がった時
  disconnected: ->
    # Called when the subscription has been terminated by the server
    #接続の解除が起こった時
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    #受信をした時に実行されるコールバック関数
