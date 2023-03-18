import { NextFunction } from 'express'
import { PrismaClient } from '@prisma/client'
import { Request, Response } from 'express'

const prisma = new PrismaClient()

export const gettestController = async (
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
      ...rotations[0],
      initialState: rotations[0].initialState,
      waves: rotations[0].waves.map((wave) => ({
        ...wave,
        spawn1: {
          id: wave!.spawn1!.id,
          objective: wave.spawn1?.objective,
          spawnLocation: wave.spawn1?.spawnLocation,
          selectedOptions: wave.spawn1?.spawnOneClasses.map((spawnClass) => {
            const selectedInitialClass = rotations[0]!.initialState!.initialClasses.find(
              (classes) => classes.classId === spawnClass.classId
            )
            return { classId: spawnClass.classId, title: selectedInitialClass?.title, color: selectedInitialClass?.color, image: selectedInitialClass?.image }
          }),
        },
        spawn2: {
          id: wave!.spawn1!.id,
          objective: wave.spawn1?.objective,
          spawnLocation: wave.spawn1?.spawnLocation,
          selectedOptions: wave.spawn2?.spawnTwoClasses.map((spawnClass) => {
            const selectedInitialClass = rotations[0]!.initialState!.initialClasses.find(
              (classes) => classes.classId === spawnClass.classId
            )
            return { classId: spawnClass.classId, title: selectedInitialClass?.title, color: selectedInitialClass?.color, image: selectedInitialClass?.image }
          }),
        },
        spawn3: {
          id: wave!.spawn1!.id,
          objective: wave.spawn1?.objective,
          spawnLocation: wave.spawn1?.spawnLocation,
          selectedOptions: wave.spawn3?.spawnThreeClasses.map((spawnClass) => {
            const selectedInitialClass = rotations[0]!.initialState!.initialClasses.find(
              (classes) => classes.classId === spawnClass.classId
            )
            return { classId: spawnClass.classId, title: selectedInitialClass?.title, color: selectedInitialClass?.color, image: selectedInitialClass?.image }
          }),
        },
      })),
    })
  } catch (err) {}
}
export const postConstroller = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const { initialState, waves } = req.body
  console.log(req.body)
  try {
    await prisma.weeklyRotation.create({
      data: {
        initialState: {
          create: {
            ...initialState,
            initialClasses: {
              create: initialState.initialClasses,
            },
          },
        },

        // I should only get array of classId numbers here, in initial state I'll have full data and in database I will just store
        // id's. when front asks me I will give Id's and front will loop to get full data from initial state.
        waves: {
          create: waves.map((wavee) => ({
            spawn1: {
              create: {
                spawnLocation: wavee.spawn1.spawnLocation,
                spawnOneClasses: {
                  create: wavee.spawn1.selectedOptions,
                },
              },
            },
            spawn2: {
              create: {
                spawnLocation: wavee.spawn2.spawnLocation,
                spawnTwoClasses: {
                  create: wavee.spawn2.selectedOptions,
                },
              },
            },
            spawn3: {
              create: {
                spawnLocation: wavee.spawn3.spawnLocation,
                spawnThreeClasses: {
                  create: wavee.spawn3.selectedOptions,
                },
              },
            },
          })),
        },
      },
    })

    res.status(201).json({
      message: 'added successfully',
    })
  } catch (err) {
    console.log(err)
  }
}
