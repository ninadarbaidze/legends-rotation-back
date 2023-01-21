import { testController, gettestController } from "../controllers/test-controller"
import express from "express"

const router = express.Router()

router.post('/test', testController as any)
router.get('/test', gettestController as any)

export default router
