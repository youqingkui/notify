app = require('express')()
http = require('http').Server(app)
io = require('socket.io')(http)

app.get '/', (req, res) ->
  res.sendFile(__dirname + '/index.html')


chat = io.of('/chat').on 'connection', (socket) ->
  console.log socket.id + "connect"

  socket.emit 'welcome', 'Hello'

  socket.on 'disconnect', () ->
    console.log('user disconnected')


setTimeout () ->
  chat.emit 'a message', "setTimeout"

,5000

#io.on 'connection', (socket) ->
#  console.log 'a user connected'
#
#  socket.emit 'welcome', 'hello'
#
#  socket.on 'chat message', (msg) ->
#    io.emit('chat message', msg)
#    console.log 'message: ' + msg
#
#  socket.on 'disconnect', () ->
#    console.log('user disconnected')


http.listen 3002, () ->
  console.log 'listening on *:3002'