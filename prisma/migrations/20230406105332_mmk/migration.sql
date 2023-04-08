/*
  Warnings:

  - You are about to drop the column `weeklyMapId` on the `Locations` table. All the data in the column will be lost.
  - Added the required column `mapId` to the `Locations` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Locations` DROP FOREIGN KEY `Locations_weeklyMapId_fkey`;

-- AlterTable
ALTER TABLE `Locations` DROP COLUMN `weeklyMapId`,
    ADD COLUMN `mapId` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Locations` ADD CONSTRAINT `Locations_mapId_fkey` FOREIGN KEY (`mapId`) REFERENCES `WeeklyMap`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
