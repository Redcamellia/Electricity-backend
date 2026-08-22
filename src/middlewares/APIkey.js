function apiKey(req, res, next) {
  const key = req.header("express-api-key");

  if (key !== "ehsan") {
    res.status(401).json({ error: "invalid API key" });
    console.log(key);
    return;
  }
  next();
}

module.exports = apiKey;
