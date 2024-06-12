const users = [
    {
        id: 1,
        fullName: "Felipe Akira Nozaki",
        email: "felipe@gmail.com",
        username: "felipeakira",
        password: "123123",
        favoriteGenres: ["Rock", "Jazz"]
    }
];

exports.getAllUsers = (req, res) => {
    res.status(200).json(users);
}

exports.createUser = (req, res, io) => {
    const { fullName, email, username, password, favoriteGenres } = req.body;
    const newUser = {
        id: users.length + 1, // Assumindo IDs sequenciais
        fullName,
        email,
        username,
        password,
        favoriteGenres: favoriteGenres || []
    };
    users.push(newUser);
    io.emit("USER_CREATED", newUser);
    res.status(201).json(newUser);
}


exports.getUserById = (req, res) => {
    const { id } = req.params;
    const user = users.find(u => u.id === parseInt(id));
    if (user) {
        res.status(200).json(user);
    } else {
        res.status(404).json({ message: "User not found" });
    }
}

exports.updateUser = (req, res, io) => {
    const { id } = req.params;
    const { fullName, email, username, password, favoriteGenres } = req.body;
    const user = users.find(u => u.id === parseInt(id));
    if (user) {
        user.fullName = fullName || user.fullName;
        user.email = email || user.email;
        user.username = username || user.username;
        user.password = password || user.password;
        user.favoriteGenres = favoriteGenres || user.favoriteGenres;
        res.status(200).json(user);
    } else {
        res.status(404).json({ message: "User not found" });
    }
}


exports.deleteUser = (req, res) => {
    const { id } = req.params;
    const index = users.findIndex(u => u.id === parseInt(id));
    if (index !== -1) {
        users.splice(index, 1);
        res.status(204).send();
    } else {
        res.status(404).json({ message: "User not found" });
    }
}
