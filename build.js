const dotenv = require("dotenv")
const fs = require("fs")

dotenv.config()

const html = fs.readFileSync("./src/index.html", { encoding: "UTF-8" })

let distHtml = html

const envs = Object.keys(process.env)
envs.forEach(key => {
    const reg = new RegExp(`{{${key}}}`, "gmi")
    distHtml = distHtml.replace(reg, process.env[key])
});

fs.mkdirSync("./dist", { recursive: true })
fs.writeFileSync("./dist/index.html", distHtml)