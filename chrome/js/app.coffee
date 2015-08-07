socket = io('http://localhost:3002/chat')


socket.on 'chat message', (msg) ->
  console.log msg


socket.on 'welcome', (msg, t) ->
  options = {
    type: "basic"
    title: "链接通知"
    message: "已链接到socket：" + msg
    iconUrl:'images/1.png'
    buttons:[{'title':'OK'}, {'title':'NO'}]
  }
  chrome.notifications.create "123", options, (test) ->
    console.log("test", test)

  console.log msg, t


socket.on 'a message', (msg) ->
  console.log "a message", msg


chrome.notifications.onClosed.addListener (test)->
  console.log "test ===>", test
  console.log "close ok"

chrome.notifications.onClicked.addListener (id) ->
  console.log "id click", id


chrome.notifications.onButtonClicked.addListener (id, bt) ->
  console.log "id onButtonClicked", id, bt