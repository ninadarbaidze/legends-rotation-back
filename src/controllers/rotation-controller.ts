import { PrismaClient } from '@prisma/client'
import { Request, Response } from 'express'
import { ClassInitialState, Wave } from 'types/global'
import {
  calculateCurrentVersion,
  createRotationHandler,
  formatResponseDataForFrontEnd,
} from 'utils'
import jwt, { JwtPayload } from 'jsonwebtoken'

const prisma = new PrismaClient()

export const getRotations = async (req: Request, res: Response) => {
  const { token } = req.params
  const { id } = jwt.verify(
    token,
    process.env.JWT_SEC_ROT as string
  ) as JwtPayload
  if (!id) {
    return res.status(404).json({
      message: "rotation doesn't exists",
    })
  } else {
    try {
      const rotation = await prisma.weeklyRotation.findUnique({
        where: {
          id: +id,
        },
        include: {
          initialState: {
            include: {
              initialClasses: true,
            },
          },
          waves: {
            include: {
              spawns: {
                include: {
                  spawn: {
                    include: {
                      classes: {
                        include: {
                          class: true,
                        },
                      },
                      actions: {
                        include: {
                          action: true,
                        },
                      },
                    },
                  },
                },
              },
            },
          },
          weeklyMap: true,
        },
      })

      res.json(formatResponseDataForFrontEnd(rotation))
    } catch (err: any) {
      return res.status(500).json({
        message: err.message,
      })
    }
  }
}

export const getAllRotations = async (_: Request, res: Response) => {
  try {
    const rotations = await prisma.weeklyRotation.findMany({
      include: {
        initialState: {
          include: {
            initialClasses: true,
          },
        },
      },
      orderBy: {
        initialState: {
          date: 'desc',
        },
      },
    })

    res.json(rotations)
  } catch (err: any) {
    return res.status(500).json({
      message: err.message,
    })
  }
}

export const postRotations = async (req: Request, res: Response) => {
  const { initialState, waves, weeklyMap } = req.body
  const { token } = req.params
  let existedRotation

  if (token) {
    const { id } = jwt.verify(
      token,
      process.env.JWT_SEC_ROT as string
    ) as JwtPayload

    existedRotation = await prisma.weeklyRotation.findUnique({
      where: {
        id: +id,
      },
      include: { initialState: true },
    })
  }

  try {
    const existingWeeklyMap = await prisma.weeklyMap.findUnique({
      where: {
        id: weeklyMap.value ?? weeklyMap?.id,
      },
    })

    let response
    if (existingWeeklyMap) {
      response = await createRotationHandler(
        initialState,
        waves,
        existedRotation as {
          initialState: { author: string; version: string }
        },
        weeklyMap
      )
    }

    const token = jwt.sign(
      { id: response?.id },
      process.env.JWT_SEC_ROT as string
    )

    res.status(201).json({
      message: 'added successfully',
      rotationId: token,
    })
  } catch (err: any) {
    return res.status(500).json({
      message: err.message,
    })
  }
}

export const getWeeklyMapTitles = async (_: Request, res: Response) => {
  try {
    const weeklyMaps = await prisma.weeklyMap.findMany()
    res.json(weeklyMaps)
  } catch (err: any) {
    return res.status(500).json({
      message: err.message,
    })
  }
}

export const getWeeklyMapLocations = async (req: Request, res: Response) => {
  const { weeklyMapId } = req.params
  try {
    const locationsBasedOnMaps = await prisma.weeklyMap.findUnique({
      where: {
        id: +weeklyMapId,
      },
      include: {
        locations: true,
      },
    })

    const formattedData = locationsBasedOnMaps?.locations.map(
      (location) => location.location
    )

    res.json(formattedData)
  } catch (err: any) {
    return res.status(500).json({
      message: err.message,
    })
  }
}
