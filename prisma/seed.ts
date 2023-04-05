import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()
const weeklyMaps = [
  {
    mapId: 1,
    title: 'The Shores of Vengeance',
    locations: [
      {location: 'Boat'},
      {location: 'Beach'},
      {location: 'Forest R (cliff)'},
      {location: 'Forest M (cliff)'},
      {location: 'Hut (cliff)'},
    ]
  },
  {
    mapId: 2,
    title: 'The Defense of Aoi Village',
    locations: [
      {location: 'beach (stable)'},
      {location: 'Forest (farm)'},
      {location: 'Field (farm)'},
      {location: 'Villa'},
    ]
  },
  {
    mapId: 3,
    title: 'The Shadows of War',
    locations: [
      {location: 'Stable'},
      {location: 'Barracks L'},
      {location: 'Barracks M'},
      {location: 'Barracks R'},
      {location: 'Dojo D'},
      {location: 'Dojo S'},
    ]
  },
  {
    mapId: 4,
    title: 'Blood in the Snow',
    locations: [
      {location: 'Camp'},
      {location: 'Mine'},
      {location: 'Outpost'},
    ]
  },
  {
    mapId: 5,
    title: 'Twilight and Ashes',
    locations: [
      {location: 'Obelisk'},
      {location: 'Lighthouse'},
      {location: 'Boulder (lighthouse)'},
      {location: 'Cliff (lighthouse)'},
      {location: 'Boulder (ledge)'},
      {location: 'Cliff (ledge)'},
    ]
  },
  {
    mapId: 6,
    title: 'Blood and Steel',
    locations: [
      {location: 'Cliff'},
      {location: 'Field (cliff)'},
      {location: 'Field (Island)'},
      {location: 'Riverside (Island)'},
      {location: 'Forest (camp)'},
      {location: 'Riverside (camp)'},
    ]
  }
]

async function main() {
  for (const map of weeklyMaps) {
    const existingMap = await prisma.weeklyMap.findUnique({
      where: {
        mapId: map.mapId,
      },
    })

    if (!existingMap) {
      await prisma.weeklyMap.create({
        data: { title: map.title, mapId: map.mapId, locations: {
          create: map.locations
        } },
      })
    } 
  }

  await prisma.$disconnect()
}

main()
  .catch((e) => {
    console.error(e)
    process.exit(1)
  })