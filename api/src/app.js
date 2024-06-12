const express = require('express');
const app = express();
const http = require('http');
const socketIo = require('socket.io');
const cors = require('cors');
app.use(cors());
app.use(express.json());

var server = http.createServer(app);
server.listen(3000, () => {
    console.log("server started");
});
    
const io = socketIo(server);
io.on('connection', (socket) => {
    console.log('A user connected');
});

const userRouter = require('./routes/userRouter')(io);
app.use('/users', userRouter);

