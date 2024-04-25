import { Request, Response } from "express";
import { courseService } from "./course.service";

const createCourse = async(req: Request, res: Response) => {
    try {
        const result = await courseService.createCourse(req.body)
        res.send({
            success:  true,
            message: "Create course successfulluy",
            data: result
        })
    } catch (error) {
        console.log(error);
    }
}

const createCourseContent = async(req: Request, res: Response) => {
    try {
        const result = await courseService.createCourseContent(req.body)
        res.send({
            success:  true,
            message: "Create course content successfulluy",
            data: result
        })
    } catch (error) {
        console.log(error);
    }
}


export const courseController = {
    createCourse,
    createCourseContent
}