/*
  Warnings:

  - A unique constraint covering the columns `[initialStateId]` on the table `WeeklyMap` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `initialStateId` to the `WeeklyMap` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `WeeklyMap` ADD COLUMN `initialStateId` INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `WeeklyMap_initialStateId_key` ON `WeeklyMap`(`initialStateId`);

-- AddForeignKey
ALTER TABLE `WeeklyMap` ADD CONSTRAINT `WeeklyMap_initialStateId_fkey` FOREIGN KEY (`initialStateId`) REFERENCES `InitialState`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
