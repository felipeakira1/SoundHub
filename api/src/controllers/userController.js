const users = [
    { id: 1, name: "Felipe" }
];

function getAllUsers(req, res) {
    res.status(200).json(users);
}

function createUser(req, res) {
    const { name } = req.body;
    const newUser = {
        id: users.length + 1,
        name
    };
    users.push(newUser);
    res.status(201).json(newUser);
}

function getUserById(req, res) {
    const { id } = req.params;
    const user = users.find(u => u.id === parseInt(id));
    if (user) {
        res.status(200).json(user);
    } else {
        res.status(404).json({ message: "User not found" });
    }
}

function updateUser(req, res) {
    const { id } = req.params;
    const { name } = req.body;
    const user = users.find(u => u.id === parseInt(id));
    if (user) {
        user.name = name;
        res.status(200).json(user);
    } else {
        res.status(404).json({ message: "User not found" });
    }
}

function deleteUser(req, res) {
    const { id } = req.params;
    const index = users.findIndex(u => u.id === parseInt(id));
    if (index !== -1) {
        users.splice(index, 1);
        res.status(204).send();
    } else {
        res.status(404).json({ message: "User not found" });
    }
}

module.exports = { getAllUsers, createUser, getUserById, updateUser, deleteUser };
