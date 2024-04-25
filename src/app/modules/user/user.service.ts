import { prisma } from "../../helpers/prisma"

const createUser = async(payload: any) => {
    const result = await prisma.user.create({
        data:payload
    })
    return result
}

const getAllUsers = async() => {
    const result = await prisma.user.findMany()
    return result
}


export const userService = {
    createUser,
    getAllUsers
}


// async createSlot(req, res) {
//     try {
//       const { date, startTime, endTime, instructorId } = req.body;

//       // Parse date and time strings into JavaScript Date objects
//       const start = new Date(`${date} ${startTime}`);
//       const end = new Date(`${date} ${endTime}`);

//       // Check if there is any overlapping slot for the instructor on the same date
//       const existingSlots = await Slot.findAll({
//         where: {
//           instructorId,
//           startTime: { [Op.lt]: end },
//           endTime: { [Op.gt]: start }
//         }
//       });

//       // Check if any of the existing slots overlap with the new slot
//       const isOverlap = existingSlots.some(slot => (
//         (slot.startTime < end && slot.endTime > start)
//       ));

//       if (isOverlap) {
//         return res.status(400).json({ error: 'Slot overlaps with existing slot' });
//       }

//       // Create the slot
//       const slot = await Slot.create({
//         startTime: start,
//         endTime: end,
//         instructorId
//       });

//       return res.status(201).json(slot);
//     } catch (error) {
//       console.error(error);
//       return res.status(500).json({ error: 'Internal server error' });
//     }
//   }
// };