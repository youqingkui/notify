// Generated by CoffeeScript 1.8.0
(function() {
  var app, http, io;

  app = require('express')();

  http = require('http').Server(app);

  io = require('socket.io')(http);

  app.get('/', function(req, res) {
    return res.sendFile(__dirname + '/index.html');
  });

  io.on('connection', function(socket) {
    console.log('a user connected');
    socket.emit('welcome', 'hello');
    socket.on('chat message', function(msg) {
      io.emit('chat message', msg);
      return console.log('message: ' + msg);
    });
    return socket.on('disconnect', function() {
      return console.log('user disconnected');
    });
  });

  http.listen(3002, function() {
    return console.log('listening on *:3002');
  });

}).call(this);

//# sourceMappingURL=app.js.map