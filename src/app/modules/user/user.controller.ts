import { Request, Response } from "express";
import { userService } from "./user.service";

const createUser = async(req: Request, res: Response) => {
    try {
        const result = await userService.createUser(req.body)
        res.send({
            success:  true,
            message: "Create user successfulluy",
            data: result
        })
    } catch (error) {
        console.log(error);
    }
}

const getAllUsers = async(req: Request, res: Response) => {
    try {
        const result = await userService.getAllUsers()
        res.send({
            success:  true,
            message: "Fetched all users successfulluy",
            data: result
        })
    } catch (error) {
        console.log(error);
    }
}

export const userController = {
    createUser,
    getAllUsers
}