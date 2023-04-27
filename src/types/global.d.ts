import { InitialState, WeeklyRotation } from "@prisma/client"

const prisma = new PrismaClient()


export type ClassInitialState = {
  classId: number 
  title: string
  image: string
  color: string
}

export type FormClasses = {
  initialState: {
    author: string
    initialClasses: ClassInitialState[]
    date: string | Date
    version: string
    weeklyModifier: string
  }
  waves: Wave[]
}

export type Wave = {
  spawn1: {
    spawnLocation: string
    selectedOptions: ClassInitialState[]
    actions: Actions[]
    extra: string[]
  }
  spawn2: {
    spawnLocation: string
    selectedOptions: ClassInitialState[]
    actions: Actions[]
    extra: string[]
    objective: string
  }
  spawn3: {
    spawnLocation: string
    selectedOptions: ClassInitialState[]
    actions: Actions[]
    extra: string[]
    objective: string
  }
  objective: { name: number, value: number }
  comment: string
}

export type Actions = {
  name?: string
  value?: number
}



