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
              spawn1: {
                include: { spawnOneClasses: true, spawnOneAction: true },
              },
              spawn2: {
                include: { spawnTwoClasses: true, spawnTwoAction: true },
              },
              spawn3: {
                include: { spawnThreeClasses: true, spawnThreeAction: true },
              },
              objective: true
            },
          },
          weeklyMap: true
        },
      })

      res.json({
        ...rotation,
        initialState: rotation!.initialState,
        waves: rotation!.waves.map((wave) => ({
          ...wave,
          spawn1: {
            id: wave!.spawn1!.id,
            spawnLocation: wave.spawn1?.spawnLocation,
            selectedOptions: wave.spawn1?.spawnOneClasses.map((spawnClass) => {
              const selectedInitialClass =
                rotation!.initialState?.initialClasses.find(
                  (classes) => classes.classId === spawnClass.classId
                )
              return {
                classId: spawnClass.classId,
                title: selectedInitialClass?.title,
                color: selectedInitialClass?.color,
                image: selectedInitialClass?.image,
              }
            }),
            actions: wave.spawn1?.spawnOneAction.map((item) => ({
              value: item.name,
            })),
          },
          spawn2: {
            id: wave!.spawn1!.id,
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
            actions: wave.spawn2?.spawnTwoAction.map((item) => ({
              value: item.name,
            })),
          },
          spawn3: {
            id: wave!.spawn1!.id,
            spawnLocation: wave.spawn1?.spawnLocation,
            selectedOptions: wave.spawn3?.spawnThreeClasses.map(
              (spawnClass) => {
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
              }
            ),
            actions: wave.spawn3?.spawnThreeAction.map((item) => ({
              value: item.name,
            })),
          },
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
      })

      res.json(
        rotations
      )
    } catch (err: any) {
      return res.status(500).json({
        message: err.message,
      })
    }
  }


export const postRotations = async (req: Request, res: Response) => {
  const { initialState, waves, weeklyMap } = req.body
  const { id } = req.params


  try {
    let existedRotation
    if(id) {
      existedRotation = await prisma.weeklyRotation.findUnique( {where: {
        id: +id,
      }, include: {initialState: true}})
    }
    const existingWeeklyMap = await prisma.weeklyMap.findUnique({
      where: {
        id: weeklyMap.value ?? weeklyMap.id
      }
    });

    console.log('sds', weeklyMap)
    
    let response
    if(existingWeeklyMap) {
          const initialClasses = initialState.initialClasses?.map((item: ClassInitialState) => ({
            classId: item.classId,
            title: item.title,
            image: item.image,
            color: item.color,
          }))
           response = await prisma.weeklyRotation.create({
            data: {
              weeklyMapId: existingWeeklyMap.id,
              initialState: {
                create: {
                  author: initialState.author,
                  date: initialState.date ?? new Date(),
                  version: existedRotation?.initialState?.author === initialState.author ? calculateCurrentVersion(initialState.version)  : initialState.version,
                  weeklyModifier: initialState.weeklyModifier,
                  initialClasses: {
                    create: initialClasses,
                  },
                  isPublic: initialState.isPublic === 'yes'
                },
              },
              waves: {
                create: waves.map((wave: Wave) => ({
                  spawn1: {
                    create: {
                      spawnLocation: wave.spawn1.spawnLocation,
                      spawnOneClasses: {
                        create: wave.spawn1.selectedOptions.map((item) => ({
                          classId: item.classId,
                        })),
                      },
                      spawnOneAction: {
                        create: wave.spawn1.actions.map((item) => ({
                          name: item?.value,
                        })),
                      },
                    },
                  },
                  spawn2: {
                    create: {
                      spawnLocation: wave.spawn2.spawnLocation,
                      spawnTwoClasses: {
                        create: wave.spawn2.selectedOptions.map((item) => ({
                          classId: item.classId,
                        })),
                      },
                      spawnTwoAction: {
                        create: wave.spawn2.actions.map((item) => ({
                          name: item?.value,
                        })),
                      },
                    },
                  },
                  spawn3: {
                    create: {
                      spawnLocation: wave.spawn3.spawnLocation,
                      spawnThreeClasses: {
                        create: wave.spawn3.selectedOptions.map((item) => ({
                          classId: item.classId,
                        })),
                      },
                      spawnThreeAction: {
                        create: wave.spawn3.actions.map((item) => ({
                          name:  item?.value,
                        })),
                      },
                    },
                  },
                  objective: {
                    create:  {name: wave.objective?.value ? wave.objective?.value : wave.objective?.name ? wave.objective?.name :  0} ,
                  },
                })),
              },
             
              
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


export const  getWeeklyMapTitles = async (_: Request, res: Response) => {
  try {
    const weeklyMaps = await prisma.weeklyMap.findMany()
    res.json(weeklyMaps)
    
  } catch(err: any){
    return res.status(500).json({
      message: err.message,
    })
  }
}

export const  getWeeklyMapLocations = async (req: Request, res: Response) => {
  const {weeklyMapId} = req.params
  console.log(weeklyMapId)
  try {
    const locationsBasedOnMaps = await prisma.weeklyMap.findUnique({
      where: {
        id: +weeklyMapId
      },
      include: {
        locations: true
      }
    })

    const formattedData = locationsBasedOnMaps?.locations.map(location => location.location )

    res.json(formattedData)
  } catch(err: any){
    return res.status(500).json({
      message: err.message,
    })
  }

}