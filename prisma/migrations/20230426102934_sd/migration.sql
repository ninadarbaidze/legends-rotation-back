/*
  Warnings:

  - The primary key for the `SpawnsOnClasses` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ClassesId` on the `SpawnsOnClasses` table. All the data in the column will be lost.
  - Added the required column `classesId` to the `SpawnsOnClasses` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `SpawnsOnClasses` DROP FOREIGN KEY `SpawnsOnClasses_ClassesId_fkey`;

-- AlterTable
ALTER TABLE `SpawnsOnClasses` DROP PRIMARY KEY,
    DROP COLUMN `ClassesId`,
    ADD COLUMN `classesId` INTEGER NOT NULL,
    ADD PRIMARY KEY (`spawnId`, `classesId`);

-- AddForeignKey
ALTER TABLE `SpawnsOnClasses` ADD CONSTRAINT `SpawnsOnClasses_classesId_fkey` FOREIGN KEY (`classesId`) REFERENCES `Classes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
