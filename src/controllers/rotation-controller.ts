import { PrismaClient } from '@prisma/client'
import { Request, Response } from 'express'
import { ClassInitialState, Wave } from 'types/global'
import { calculateCurrentVersion } from 'utils/rotationHelpers'

const prisma = new PrismaClient()

export const getRotations = async (req: Request, res: Response) => {
  const { rotationId } = req.params
  if (!rotationId) {
    return res.status(404).json({
      message: "rotation doesn't exists",
    })
  } else {
    try {
      const rotation = await prisma.weeklyRotation.findUnique({
        where: {
          id: +rotationId,
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
                          class: true
                        }
                      },
                      actions: {
                        include: {
                          action: true
                        }
                      }
                    },
                  },
                  
                },
              
              },
            
            
            },
            
          },
          weeklyMap: true,
        },
      })

      res.json({
        ...rotation,
        initialState: rotation?.initialState,
        waves: rotation!.waves.map((wave) => ({
          spawn1: {
            id: wave!.spawns[0]!.spawn.id,
            spawnLocation: wave!.spawns[0]!.spawn.spawnLocation,
            selectedOptions: wave!.spawns[0]!.spawn.classes.map((spawnClass) => {
              const selectedInitialClass =
                rotation!.initialState?.initialClasses.find(
                  (classes) => classes.classId === spawnClass.class.classId
                )
              return {
                classId: spawnClass.class.classId,
                title: selectedInitialClass?.title,
                color: selectedInitialClass?.color,
                image: selectedInitialClass?.image,
              }
            }),
            actions:  wave!.spawns[0]!.spawn.actions.map((item) => ({
              value: item.action.name,
            })),
          },
          spawn2: {
            id: wave!.spawns[1]!.spawn.id,
            spawnLocation: wave!.spawns[1]!.spawn.spawnLocation,
            selectedOptions: wave!.spawns[1]!.spawn.classes.map((spawnClass) => {
              const selectedInitialClass =
                rotation!.initialState?.initialClasses.find(
                  (classes) => classes.classId === spawnClass.class.classId
                )
              return {
                classId: spawnClass.class.classId,
                title: selectedInitialClass?.title,
                color: selectedInitialClass?.color,
                image: selectedInitialClass?.image,
              }
            }),
            actions:  wave!.spawns[1]!.spawn.actions.map((item) => ({
              value: item.action.name,
            })),
          },
          spawn3: {
            id: wave!.spawns[2]!.spawn.id,
            spawnLocation: wave!.spawns[2]!.spawn.spawnLocation,
            selectedOptions: wave!.spawns[2]!.spawn.classes.map((spawnClass) => {
              const selectedInitialClass =
                rotation!.initialState?.initialClasses.find(
                  (classes) => classes.classId === spawnClass.class.classId
                )
              return {
                classId: spawnClass.class.classId,
                title: selectedInitialClass?.title,
                color: selectedInitialClass?.color,
                image: selectedInitialClass?.image,
              }
            }),
            actions:  wave!.spawns[2]!.spawn.actions.map((item) => ({
              value: item.action.name,
            })),
          },
          objective: wave.objective,
          comment: wave.comment
        })),
      })
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
  const { initialState, waves, spawnMap, weeklyMap } = req.body
  const { id } = req.query
  console.log(spawnMap, weeklyMap)
  try {
    let existedRotation
    if (id) {
      existedRotation = await prisma.weeklyRotation.findUnique({
        where: {
          id: +id,
        },
        include: { initialState: true },
      })
    }
    const existingWeeklyMap = await prisma.weeklyMap.findUnique({
      where: {
        id:  weeklyMap.value ?? weeklyMap?.id
      }
    });


    let response
    if (existingWeeklyMap) {
      const initialClasses = initialState.initialClasses?.map(
        (item: ClassInitialState) => ({
          classId: item.classId,
          title: item.title,
          image: item.image,
          color: item.color,
        })
      )
      response = await prisma.weeklyRotation.create({
        data: {
          initialState: {
            create: {
              author: initialState.author,
              date: initialState.date === '' ? new Date() : initialState.date,
              version:
                existedRotation?.initialState?.author === initialState.author &&
                initialState?.version === ''
                  ? calculateCurrentVersion(
                      existedRotation?.initialState?.version as string
                    )
                  : initialState.version,
              weeklyModifier: initialState.weeklyModifier,
              initialClasses: {
                create: initialClasses,
              },
              isPublic: initialState.isPublic === 'yes',
            },
          },
          waves: {
            create: waves.map((wave: Wave) => ({
              objective: wave?.objective?.value ?? wave?.objective,
              comment: wave.comment,
              spawns: {
                create: [
                  {
                    spawn: {
                      create: {
                        spawnLocation: wave.spawn1.spawnLocation,
                        classes: {
                          create: wave.spawn1.selectedOptions.map((item) => ({
                            class: {
                              create: {
                                classId: item.classId,
                              },
                            },
                          })),
                        },
                        actions: {
                          create: wave.spawn1.actions.map((item) => ({
                            action: { create: { name: item?.value } },
                          })),
                        },
                      },
                    },
                  },
                  {
                    spawn: {
                      create: {
                        spawnLocation: wave.spawn2.spawnLocation,
                        classes: {
                          create: wave.spawn2.selectedOptions.map((item) => ({
                            class: {
                              create: {
                                classId: item.classId,
                              },
                            },
                          })),
                        },
                        actions: {
                          create: wave.spawn2.actions.map((item) => ({
                            action: { create: { name: item?.value } },
                          })),
                        },
                      },
                    },
                  },
                  {
                    spawn: {
                      create: {
                        spawnLocation: wave.spawn3.spawnLocation,
                        classes: {
                          create: wave.spawn3.selectedOptions.map((item) => ({
                            class: {
                              create: {
                                classId: item.classId,
                              },
                            },
                          })),
                        },
                        actions: {
                          create: wave.spawn3.actions.map((item) => ({
                            action: { create: { name: item?.value } },
                          })),
                        },
                      },
                    },
                  },
                ],
              },
            })),
          },
          weeklyMap: { connect: { id: weeklyMap.value ?? weeklyMap.id } },
        },
      })
    }

    res.status(201).json({
      message: 'added successfully',
      rotationId: response?.id,
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
