/*
  Warnings:

  - You are about to drop the column `initialStateId` on the `WeeklyMap` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[weeklyMapId]` on the table `WeeklyRotation` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[initialStateId]` on the table `WeeklyRotation` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `initialStateId` to the `WeeklyRotation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `weeklyMapId` to the `WeeklyRotation` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `WeeklyMap` DROP FOREIGN KEY `WeeklyMap_initialStateId_fkey`;

-- AlterTable
ALTER TABLE `WeeklyMap` DROP COLUMN `initialStateId`;

-- AlterTable
ALTER TABLE `WeeklyRotation` ADD COLUMN `initialStateId` INTEGER NOT NULL,
    ADD COLUMN `weeklyMapId` INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `WeeklyRotation_weeklyMapId_key` ON `WeeklyRotation`(`weeklyMapId`);

-- CreateIndex
CREATE UNIQUE INDEX `WeeklyRotation_initialStateId_key` ON `WeeklyRotation`(`initialStateId`);

-- AddForeignKey
ALTER TABLE `WeeklyRotation` ADD CONSTRAINT `WeeklyRotation_weeklyMapId_fkey` FOREIGN KEY (`weeklyMapId`) REFERENCES `WeeklyMap`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
