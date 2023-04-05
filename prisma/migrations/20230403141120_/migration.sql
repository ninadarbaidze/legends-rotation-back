/*
  Warnings:

  - A unique constraint covering the columns `[mapId]` on the table `WeeklyMap` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `mapId` to the `WeeklyMap` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `WeeklyMap_title_key` ON `WeeklyMap`;

-- AlterTable
ALTER TABLE `WeeklyMap` ADD COLUMN `mapId` INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `WeeklyMap_mapId_key` ON `WeeklyMap`(`mapId`);
