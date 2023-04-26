/*
  Warnings:

  - The primary key for the `SpawnsOnClasses` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `classesId` on the `SpawnsOnClasses` table. All the data in the column will be lost.
  - Added the required column `classId` to the `SpawnsOnClasses` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `SpawnsOnClasses` DROP FOREIGN KEY `SpawnsOnClasses_classesId_fkey`;

-- AlterTable
ALTER TABLE `SpawnsOnClasses` DROP PRIMARY KEY,
    DROP COLUMN `classesId`,
    ADD COLUMN `classId` INTEGER NOT NULL,
    ADD PRIMARY KEY (`spawnId`, `classId`);

-- AddForeignKey
ALTER TABLE `SpawnsOnClasses` ADD CONSTRAINT `SpawnsOnClasses_classId_fkey` FOREIGN KEY (`classId`) REFERENCES `Classes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
