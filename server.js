const express = require("express");
const helmet = require("helmet");
const dotenv = require("dotenv");
const expressHandlebars = require("express-handlebars");

dotenv.config();

const app = express();
const port = 3000;

app.engine(".hbs", expressHandlebars({ extname: ".hbs" }));

app.set("view engine", ".hbs");

app.use(helmet());

app.get("/", (req, res) => {
  res.render("index", { env: process.env });
});

app.listen(port, () =>
  console.log(`Example app listening at http://localhost:${port}`)
);
