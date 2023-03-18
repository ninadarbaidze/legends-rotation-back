import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

async function main() {
  await prisma.weeklyRotation.upsert({
    where: { id: 2 },
    update: {},
    create: {
      initialState: {
        create: {
          date: '12/12/12',
          version: '1.2',
          author: 'Veriko',
          weeklyModifier: 'fire',
          initialClasses: {
            create: [
              {
                classId: 1,
                title: 'ronin',
                image: 'ronin',
                color: 'red',
              },
              {
                classId: 2,
                title: 'huner',
                image: 'huner',
                color: 'blue',
              },
              {
                classId: 3,
                title: 'ronin',
                image: 'ronin',
                color: 'black',
              },
              {
                classId: 2,
                title: 'huner',
                image: 'huner',
                color: 'yellow',
              },
            ],
          }}},
          waves: {
            create: [
              {
                // initialStateId: {
                //   connect: {
                //     id: 1
                //   }
                // },
                // initialStateId: 1,
                spawn1: {
                  create: {
                    spawnLocation: 'beach',
                    // actions: {
                    //   create: {
                    //     name: 'ultimate',
                    //   },
                    // },
                    spawnOneClasses: {
                      create: [
                        {
                          classId: 1
                        },
                        {
                          classId: 1
                        },
                        {
                          classId: 2
                        },
                        {
                          classId: 3
                        },
                      ],
                    },
                  },
                },
                spawn2: {
                  create: {
                    spawnLocation: 'beach',
                    // actions: {
                    //   create: {
                    //     name: 'ultimate',
                    //   },
                    // },
                    spawnTwoClasses: {
                      create: [
                        {
                          classId: 1
                        },
                        {
                          classId: 3
                        },
                        {
                          classId: 2
                        },
                        {
                          classId: 3
                        },
                      ],
                    },
                  },
                },
                spawn3: {
                  create: {
                    spawnLocation: 'boat',
                    spawnThreeClasses: {
                       create: [
                        {
                          classId: 2
                        },
                        {
                          classId: 2
                        },
                        {
                          classId: 2
                        },
                        {
                          classId: 3
                        },
                      ],
                    },
                  },
                },
              },
            ],
          },
    },
  })

  // await prisma.initialState.update({
  //   where: { id: 1 },
  //   data: {
  //     date: '12/12/12',
  //     version: '1.1',
  //     author: 'Ninako',
  //     weeklyModifier: 'fire',
  //     weeklyRotationId: 1,
  //   },
  //   // update: {}
  // })
}
// async function main() {
//   await prisma.users.upsert({
//     update: {},
//     create: {
//       email: 'nina@nina.ge',
//       name: 'nina',
//       posts: {
//         create: {
//           title: 'Check out Prisma with Next.js',
//           published: true,
//           categories: {
//             create: {
//               assignedBy: 'Bob',
//               assignedAt: new Date(),
//               category: {
//                 create: { name: 'lalala' },
//               },
//             },
//           },
//         },
//       },
//     },
//     where: {
//       email: 'nina@nina.ge',
//     },
//   })
//   await prisma.users.upsert({
//     update: {},
//     create: {
//       email: 'beso@nina.ge',
//       name: 'beso',
//     },
//     where: {
//       email: 'beso@nina.ge',
//     },
//   })
//   await prisma.post.upsert({
//     create: {
//       authorId: 1,
//       title: 'How to become a butterfly',
//       categories: {
//         create: {
//           assignedBy: 'beso',
//           assignedAt: new Date(),
//           category: {
//             create: { name: 'lalala' },
//           },
//         },
//       },
//     },
//     where: {
//       id: 2,
//     },
//     update: {},
//   })

//   await prisma.profile.upsert({
//     create: {
//       bio: 'dimpitauri dampitauri',
//       userId: 1,
//     },
//     where: {
//       id: 1,
//     },
//     update: {},
//   })

//   await prisma.profile.upsert({
//     create: {
//       bio: 'gochoba',
//       userId: 2,
//     },
//     where: {
//       id: 3,
//     },
//     update: {},
//   })

//   await prisma.users.upsert({
//     create: {
//       name: 'gelika',
//       email: 'merhaba',
//       profile: {
//         create: {
//           bio: 'wadi ra',
//         },
//       },
//     },
//     where: {
//       id: 2,
//     },
//     update: {},
//   })

// }
main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })
