import express from 'express'
import { enrollmentController } from './enrollment.controller'

const router = express.Router()


router.post('/enroll-course', enrollmentController.enrollCourse)


export const EnrollmentRoutes = router