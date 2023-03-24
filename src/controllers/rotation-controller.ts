import { NextFunction } from 'express'
import { PrismaClient } from '@prisma/client'
import { Request, Response } from 'express'
import { Wave } from 'types/global'
import jwt, { JwtPayload } from 'jsonwebtoken'

const prisma = new PrismaClient()

export const getRotations = async (req: Request, res: Response) => {
const { id: rotationId }= req.params

console.log(rotationId)
  try {
    const rotation = await prisma.weeklyRotation.findUnique({
      where: {
        id: +rotationId
      },
      include: {
        initialState: {
          include: {
            initialClasses: true,
          },
        },
        waves: {
          include: {
            spawn1: { include: { spawnOneClasses: true } },
            spawn2: { include: { spawnTwoClasses: true } },
            spawn3: { include: { spawnThreeClasses: true } },
          },
        },
      },
    })

    res.json({
      ...rotation,
      initialState: rotation!.initialState,
      waves: rotation!.waves.map((wave) => ({
        ...wave,
        spawn1: {
          id: wave!.spawn1!.id,
          objective: wave.spawn1?.objective,
          spawnLocation: wave.spawn1?.spawnLocation,
          selectedOptions: wave.spawn1?.spawnOneClasses.map((spawnClass) => {
            const selectedInitialClass =
              rotation!.initialState!.initialClasses.find(
                (classes) => classes.classId === spawnClass.classId
              )
            return {
              classId: spawnClass.classId,
              title: selectedInitialClass?.title,
              color: selectedInitialClass?.color,
              image: selectedInitialClass?.image,
            }
          }),
        },
        spawn2: {
          id: wave!.spawn1!.id,
          objective: wave.spawn1?.objective,
          spawnLocation: wave.spawn1?.spawnLocation,
          selectedOptions: wave.spawn2?.spawnTwoClasses.map((spawnClass) => {
            const selectedInitialClass =
              rotation!.initialState!.initialClasses.find(
                (classes) => classes.classId === spawnClass.classId
              )
            return {
              classId: spawnClass.classId,
              title: selectedInitialClass?.title,
              color: selectedInitialClass?.color,
              image: selectedInitialClass?.image,
            }
          }),
        },
        spawn3: {
          id: wave!.spawn1!.id,
          objective: wave.spawn1?.objective,
          spawnLocation: wave.spawn1?.spawnLocation,
          selectedOptions: wave.spawn3?.spawnThreeClasses.map((spawnClass) => {
            const selectedInitialClass =
              rotation!.initialState!.initialClasses.find(
                (classes) => classes.classId === spawnClass.classId
              )
            return {
              classId: spawnClass.classId,
              title: selectedInitialClass?.title,
              color: selectedInitialClass?.color,
              image: selectedInitialClass?.image,
            }
          }),
        },
      })),
    })
  } catch (err: any) {
    err.statusCode = 500
    throw err
  }
}

export const postRotations = async (req: Request, res: Response) => {
  const { initialState, waves } = req.body

  try {
    const response = await prisma.weeklyRotation.create({
      data: {
        initialState: {
          create: {
            ...initialState,
            initialClasses: {
              create: initialState.initialClasses,
            },
          },
        },
        waves: {
          create: waves.map((wave: Wave) => ({
            spawn1: {
              create: {
                spawnLocation: wave.spawn1.spawnLocation,
                spawnOneClasses: {
                  create: wave.spawn1.selectedOptions,
                },
              },
            },
            spawn2: {
              create: {
                spawnLocation: wave.spawn2.spawnLocation,
                spawnTwoClasses: {
                  create: wave.spawn2.selectedOptions,
                },
              },
            },
            spawn3: {
              create: {
                spawnLocation: wave.spawn3.spawnLocation,
                spawnThreeClasses: {
                  create: wave.spawn3.selectedOptions,
                },
              },
            },
          })),
        },
      },
    })
    const token = jwt.sign(
      { rotationId: response.id },
      process.env.JWT_SEC_ROT!
    )

    res.status(201).json({
      message: 'added successfully',
      token: token,
      rotationId: response.id
    })
  } catch (err: any) {
    err.statusCode = 500
    throw err
  }
}
