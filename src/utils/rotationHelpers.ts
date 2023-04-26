import { PrismaClient } from '@prisma/client'
import { ClassInitialState, FormClasses, Wave } from 'types/global'

const prisma = new PrismaClient()

export const calculateCurrentVersion = (version: string) => {
  const convertVersionToNumber = Number(version)
  const currentVersion = convertVersionToNumber + 0.1

  return isFloat(currentVersion)
    ? currentVersion.toFixed(1).toString()
    : `${currentVersion}.0`
}

export const isFloat = (value: number) => {
  if (
    typeof value === 'number' &&
    !Number.isNaN(value) &&
    !Number.isInteger(value)
  ) {
    return true
  }

  return false
}

export const formatResponseDataForFrontEnd = (rotation: any) => {
  return {
    ...rotation,
    initialState: rotation?.initialState,
    waves: rotation!.waves.map((wave: any) => ({
      spawn1: {
        id: wave!.spawns[0]!.spawn.id,
        spawnLocation: wave!.spawns[0]!.spawn.spawnLocation,
        selectedOptions: wave!.spawns[0]!.spawn.classes.map(
          (spawnClass: { class: { classId: any } }) => {
            const selectedInitialClass =
              rotation!.initialState?.initialClasses.find(
                (classes: { classId: any }) =>
                  classes.classId === spawnClass.class.classId
              )
            return {
              classId: spawnClass.class.classId,
              title: selectedInitialClass?.title,
              color: selectedInitialClass?.color,
              image: selectedInitialClass?.image,
            }
          }
        ),
        actions: wave!.spawns[0]!.spawn.actions.map(
          (item: { action: { name: any } }) => ({
            value: item.action.name,
          })
        ),
      },
      spawn2: {
        id: wave!.spawns[1]!.spawn.id,
        spawnLocation: wave!.spawns[1]!.spawn.spawnLocation,
        selectedOptions: wave!.spawns[1]!.spawn.classes.map(
          (spawnClass: { class: { classId: any } }) => {
            const selectedInitialClass =
              rotation!.initialState?.initialClasses.find(
                (classes: { classId: any }) =>
                  classes.classId === spawnClass.class.classId
              )
            return {
              classId: spawnClass.class.classId,
              title: selectedInitialClass?.title,
              color: selectedInitialClass?.color,
              image: selectedInitialClass?.image,
            }
          }
        ),
        actions: wave!.spawns[1]!.spawn.actions.map(
          (item: { action: { name: any } }) => ({
            value: item.action.name,
          })
        ),
      },
      spawn3: {
        id: wave!.spawns[2]!.spawn.id,
        spawnLocation: wave!.spawns[2]!.spawn.spawnLocation,
        selectedOptions: wave!.spawns[2]!.spawn.classes.map(
          (spawnClass: { class: { classId: any } }) => {
            const selectedInitialClass =
              rotation!.initialState?.initialClasses.find(
                (classes: { classId: any }) =>
                  classes.classId === spawnClass.class.classId
              )
            return {
              classId: spawnClass.class.classId,
              title: selectedInitialClass?.title,
              color: selectedInitialClass?.color,
              image: selectedInitialClass?.image,
            }
          }
        ),
        actions: wave!.spawns[2]!.spawn.actions.map(
          (item: { action: { name: any } }) => ({
            value: item.action.name,
          })
        ),
      },
      objective: wave.objective,
      comment: wave.comment,
    })),
  }
}

export const createRotationHandler = async (
  initialState: {
    author: string
    date: string
    version: string
    weeklyModifier: string
    isPublic: string
    initialClasses: FormClasses['initialState']['initialClasses']
  },
  waves: Wave[],
  existedRotation: { initialState: { author: string; version: string } },
  weeklyMap: { value: number; id: number }
) => {
  const initialClasses = initialState.initialClasses?.map(
    (item: ClassInitialState) => ({
      classId: item.classId,
      title: item.title,
      image: item.image,
      color: item.color,
    })
  )
  return await prisma.weeklyRotation.create({
    data: {
      initialState: {
        create: {
          author: initialState.author,
          date:
            initialState.date === '' ? new Date() : (initialState.date as any),
          version:
            existedRotation?.initialState?.author === initialState.author &&
            initialState?.version === ''
              ? calculateCurrentVersion(
                  existedRotation?.initialState?.version as string
                )
              : initialState.version,
          weeklyModifier: initialState.weeklyModifier,
          initialClasses: {
            create:
              initialClasses as FormClasses['initialState']['initialClasses'],
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
                      create: wave.spawn1.selectedOptions.map(
                        (item: { classId: any }) => ({
                          class: {
                            create: {
                              classId: item.classId,
                            },
                          },
                        })
                      ),
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
                      create: wave.spawn2.selectedOptions.map(
                        (item: { classId: any }) => ({
                          class: {
                            create: {
                              classId: item.classId,
                            },
                          },
                        })
                      ),
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
                      create: wave.spawn3.selectedOptions.map(
                        (item: { classId: any }) => ({
                          class: {
                            create: {
                              classId: item.classId,
                            },
                          },
                        })
                      ),
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
