App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#chats').append data['chat']
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    @perform 'speak', message: message
    jQuery(document).on 'keypress', '[data-behavior~=chat_speaker]', (event) ->
      if event.keyCode is 13 # return キーのキーコードが13
        App.chat.speak event.target.value # speak メソッド, event.target.valueを引数に.
        event.target.value = ''
        alert()
        event.preventDefault()
