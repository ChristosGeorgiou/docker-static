const path = require('path')
const express = require('express')
const mustacheExpress = require('mustache-express')

const app = express()

app.engine('mustache', mustacheExpress())

app.set('view engine', 'mustache')
app.set('views', path.join(__dirname, '/'))

app.get('/', function (req, res) {
  res.render('index', {
    title: process.env.PAGE_TITLE,
    description: process.env.PAGE_DESCRIPTION,
    author: process.env.PAGE_AUTHOR,
    header: process.env.PAGE_HEADER,
    summary: process.env.PAGE_SUMMARY
  })
})

app.use(express.static(__dirname))

app.listen(80, () => console.log('Example app listening on port 80!'))
