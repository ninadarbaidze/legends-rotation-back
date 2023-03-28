import { postRotations, getRotations, editRotations } from "controllers"
import express from "express"

const router = express.Router()

router.post('/rotations/:id?', postRotations )
router.get('/rotations/:token', getRotations)
// router.patch('/rotations/:id', editRotations)

export default router
