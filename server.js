const express = require("express");
const helmet = require("helmet");
const dotenv = require("dotenv");
const expressHandlebars = require("express-handlebars");
const morgan = require("morgan");
const fs = require("fs");
const path = require("path");

dotenv.config();

const app = express();
const port = 3000;

app.engine(".hbs", expressHandlebars({ extname: ".hbs" }));

app.set("view engine", ".hbs");

app.use(helmet());

const logsDir = path.join(__dirname, "logs");
fs.mkdirSync(logsDir, { recursive: true });
var accessLogStream = fs.createWriteStream(path.join(logsDir, "access.log"), {
  flags: "a",
});

app.use(morgan("combined", { stream: accessLogStream }));

app.get("/", (req, res) => {
  res.render("index", { env: process.env });
});

app.listen(port, () =>
  console.log(`Example app listening at http://localhost:${port}`)
);
