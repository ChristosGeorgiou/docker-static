const express = require('express')
const fs = require('fs')
const app = express()

const html = fs.readFileSync('index.html', 'utf8')


app.get('/', (req, res) => res.send(html))

app.use(express.static(__dirname))

app.listen(80, () => console.log('Example app listening on port 80!'))

console.log("page_title", process.env.page_title)
console.log("page_description", process.env.page_description)
console.log("page_author", process.env.page_author)
console.log("page_header", process.env.page_header)
console.log("page_summary", process.env.page_summary)