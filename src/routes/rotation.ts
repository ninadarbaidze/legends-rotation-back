import { postRotations, getRotations, getAllRotations, getWeeklyMapTitles, getWeeklyMapLocations } from "controllers"
import express from "express"

const router = express.Router()

router.post('/rotations/:id?', postRotations )
router.get('/rotations/:rotationId', getRotations)
router.get('/all-rotations', getAllRotations)
router.get('/weekly-maps', getWeeklyMapTitles)
router.get('/locations/:weeklyMapId', getWeeklyMapLocations)

export default router
