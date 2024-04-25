import { prisma } from "../../helpers/prisma";

const enrllCourse = async (payload: any) => {
  const result = await prisma.enrollment.create({
    data: payload,
    include: {
      User: true,
      Course: true,
    },
  });
  return result;
};

export const enrollmentService = {
  enrllCourse,
};
