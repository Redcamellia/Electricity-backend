const users = [
  { id: 1, name: "Alice" },
  { id: 2, name: "Bob" },
];

function changeUserName(argId, argName) {
  const user = users.find((single) => single.id == argId);
  if (user) {
    user.name = argName;
    return user.id;
  }
  return null;
}

function getUsers(req, res) {
  res.status(200).json(users);
}
function getUser(req, res) {
  const id = req.params.id;

  const user = users.find((single) => single.id == id);

  if (!user) {
    res.status(404).json({ error: "not found" });
    res.end(JSON.stringify({ error: "user not found" }));
    return;
  }
  res.json(user);
}
function addUser(req, res) {
  const newUser = {
    id: users.length + 1,
    name: req.body.name,
  };

  users.push(newUser);

  res.status(201).json(newUser);
}

function changeUserName(req, res) {
  if (req.body.name.trim() === "") {
    console.log(req.body.name.trim());
    res.status(400).json({ error: "name must be a non empty string" });
    return;
  }

  const result = changeUserName(req.params.id, req.body.name);
  if (result) {
    res.status(200).json(result);
    return;
  }
  res.status(404).json({ error: "not found" });
}
function deleteUser(req, res) {
  const id = req.params.id;
  const user = users.find((single) => single.id == id);
  if (user) {
    users.splice(users.indexOf(user), 1);
    res.status(200).json({ msg: "user deleted successfully" });
    console.log(users);
    return;
  }
  res.status(404).json({ error: "user not found" });
  return;
}

module.exports = {
  getUser,
  getUsers,
  addUser,
  changeUserName,
  deleteUser,
};
