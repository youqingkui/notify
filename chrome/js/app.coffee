socket = io('http://localhost:3002')


socket.on 'chat message', (msg) ->
  console.log msg


socket.on 'welcome', (msg, t) ->
  options = {
    type: "basic"
    title: "链接通知"
    message: "已链接到socket：" + msg
    iconUrl:'images/1.png'
  }
  chrome.notifications.create "123", options, (test) ->
    console.log("test", test)

  console.log msg, t
