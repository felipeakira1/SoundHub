const express = require('express');
const userController = require('../controllers/userController');

module.exports = function(io) {
    const router = express.Router();
    router.get('/', userController.getAllUsers);
    router.post('/', (req, res) => userController.createUser(req, res, io));
    router.get('/:id', userController.getUserById);
    router.put('/:id', userController.updateUser);
    router.delete('/:id', userController.deleteUser);
    return router;
};