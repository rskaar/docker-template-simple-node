const app = require('express')();
const http = require('http').Server(app);
const io = require('socket.io')(http);

app.get('/', function(req, res) {
  console.log('render indexhtml');
  res.sendFile(__dirname + '/index.html');
});

io.on('connection', function(socket) {
  console.log('on connection');
  socket.on('chat message', function(msg) {
    console.log('on chat message');
    io.emit('chat message', msg);
  });
});

http.listen(3000, function() {
  console.log('listening on *:3000');
});
