const express = require('express')
const helmet = require('helmet')
const dotenv = require('dotenv')
const expressHandlebars = require('express-handlebars');
const rateLimit = require("express-rate-limit");

const expressDefend = require('express-defend');
const blacklist = require('express-blacklist');

dotenv.config()

const app = express()
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100 // limit each IP to 100 requests per windowMs
});
const port = 3000

app.engine('.hbs', expressHandlebars({ extname: '.hbs' }));

app.set('trust proxy', 1);
app.set('view engine', '.hbs');

app.use(limiter);
app.use(helmet())

app.use(blacklist.blockRequests('blacklist.txt'));
app.use(expressDefend.protect({
  maxAttempts: 3,
  dropSuspiciousRequest: true,
  onMaxAttemptsReached: function (ipAddress, url) {
    blacklist.addAddress(ipAddress);
  }
}));

app.get('/', (req, res) => {
  res.render('index', { env: process.env })
})

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))