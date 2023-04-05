/*
  Warnings:

  - You are about to drop the column `weeklyMapIdd` on the `Locations` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `Locations` DROP FOREIGN KEY `Locations_weeklyMapIdd_fkey`;

-- AlterTable
ALTER TABLE `Locations` DROP COLUMN `weeklyMapIdd`,
    ADD COLUMN `weeklyMapId` INTEGER NOT NULL DEFAULT 1;

-- CreateIndex
CREATE INDEX `Locations_weeklyMapId_idx` ON `Locations`(`weeklyMapId`);

-- AddForeignKey
ALTER TABLE `Locations` ADD CONSTRAINT `Locations_weeklyMapId_fkey` FOREIGN KEY (`weeklyMapId`) REFERENCES `WeeklyMap`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
