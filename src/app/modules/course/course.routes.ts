import express from 'express'
import { courseController } from './course.controller'

const router = express.Router()


router.post('/create-course', courseController.createCourse)

router.post('/create-course-content', courseController.createCourseContent)

export const CourseRoutes = router