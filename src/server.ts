import express from "express";
import bodyParser from 'body-parser'
import cors from 'cors'
import dotenv from 'dotenv'
import { rotation } from "routes";



const server = express()

dotenv.config()

server.use(bodyParser.json())
server.use(cors())
server.use(rotation)


 server.listen(3003, () =>
  console.log(`
  🚀 Server ready at: http://localhost:3003
  ⭐️ See sample requests: http://pris.ly/e/ts/rest-express#3-using-the-rest-api`),
  )