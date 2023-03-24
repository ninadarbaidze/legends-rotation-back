import { postRotations, getRotations } from "controllers"
import express from "express"

const router = express.Router()

router.post('/rotations', postRotations )
router.get('/rotations/:id', getRotations)

export default router
