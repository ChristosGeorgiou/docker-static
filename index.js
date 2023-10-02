const express = require("express");
const helmet = require("helmet");
const dotenv = require("dotenv");

dotenv.config();

const app = express();
const port = 3000;

app.set('view engine', 'pug')

app.use(helmet());

app.use(express.static("static"));
app.use(express.static("public"));

app.get("/", (req, res) => {
  console.log(`[${req.ip}] ${req.get("User-Agent")}`);
  res.render("index", { ...process.env });
});

app.listen(port, () =>
  console.log(`Example app listening at http://localhost:${port}`)
);
