import { prisma } from "../../helpers/prisma"



const createCourse = async(payload: any) => {
    const result = await prisma.course.create({
        data:payload
    })
    return result
}


const createCourseContent = async(payload: any) => {
    const result = await prisma.courseContent.create({
        data:payload,
        include: {
            Course: true
        }
    })
    return result
}



export const courseService = {
    createCourse,
    createCourseContent
}