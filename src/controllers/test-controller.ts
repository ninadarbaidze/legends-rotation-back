import { NextFunction } from 'express'
import { PrismaClient } from '@prisma/client'
import { Request, Response } from 'express'


const prisma = new PrismaClient()

export const gettestController = async(
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const name = req.body.name
  const email = req.body.email
  try {
    const users = await prisma.user.findMany()
    res.json(users)
  } catch(err) {
  }
}
export const  testController = async(
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const {name, email} = req.body
  try{

    await prisma.user.create({
  
      data: {
  
        name: name,
  
        email: email,
  
      },
    })
    res.status(201).json({
      message: 'added successfully',
      
    })
  } catch(err) {
    console.log(err)
  }
}
