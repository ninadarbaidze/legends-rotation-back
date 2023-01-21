import express from "express";
import bodyParser from 'body-parser'
import  test  from './routes/test'



const server = express()

server.use(bodyParser.json())

server.use(test)


 server.listen(3000, () =>
  console.log(`
  🚀 Server ready at: http://localhost:3000
  ⭐️ See sample requests: http://pris.ly/e/ts/rest-express#3-using-the-rest-api`),
  )