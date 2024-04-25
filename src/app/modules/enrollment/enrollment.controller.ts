import { Request, Response } from "express";
import { enrollmentService } from "./enrollment.service";

const enrollCourse = async (req: Request, res: Response) => {
  try {
    const result = await enrollmentService.enrllCourse(req.body);
    res.send({
      success: true,
      message: "Enroll into course successfulluy",
      data: result,
    });
  } catch (error) {
    console.log(error);
  }
};

export const enrollmentController = {
  enrollCourse,
};
