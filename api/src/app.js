const express = require('express');
const app = express();
const cors = require('cors');
app.use(cors());
app.use(express.json());

const userRouter = require('./routes/userRouter');
app.use('/users', userRouter);

app.get('/', (req, res) => {
    res.json({'message': 'Hello, World!'});
});

// const PORT = 3000;
// app.listen(PORT, () => {
//     console.log(`Servidor rodando na porta ${PORT}`);
// })

var server = require('http').createServer(app);
server.listen(3000, () => {
    console.log("server started");
})