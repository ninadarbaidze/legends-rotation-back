import { NextFunction } from 'express'
import { PrismaClient } from '@prisma/client'
import { Request, Response } from 'express'


const prisma = new PrismaClient()

export const gettestController = async(
  req: Request,
  res: Response,
  next: NextFunction
) => {
  
  try {
    // const users = await prisma.users.findMany({
    //   include: {
    //     posts: {
    //       include: {
    //         categories: true
    //       }
    //     },
    //     profile: true
    //   }
    // })
    // res.json(users)

    const rotations = await prisma.weeklyRotation.findMany({
      include: {
        initialState: {
          include: {
            initialClasses: true,
            waves: {
              include: {
                spawn1: {include:{spawnOneClasses: true}},
                spawn2: {include:{spawnTwoClasses: true}},
                spawn3: {include:{spawnThreeClasses: true}},
              }
            }
          }
        }
      }

    })
    res.json(rotations)
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
