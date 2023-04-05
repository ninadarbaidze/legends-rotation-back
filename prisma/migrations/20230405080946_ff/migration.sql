/*
  Warnings:

  - You are about to drop the column `weeklyMapId` on the `Locations` table. All the data in the column will be lost.
  - Added the required column `weeklyMapIdd` to the `Locations` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Locations` DROP FOREIGN KEY `Locations_weeklyMapId_fkey`;

-- AlterTable
ALTER TABLE `Locations` DROP COLUMN `weeklyMapId`,
    ADD COLUMN `weeklyMapIdd` INTEGER NOT NULL;

-- CreateIndex
CREATE INDEX `Locations_weeklyMapIdd_idx` ON `Locations`(`weeklyMapIdd`);

-- AddForeignKey
ALTER TABLE `Locations` ADD CONSTRAINT `Locations_weeklyMapIdd_fkey` FOREIGN KEY (`weeklyMapIdd`) REFERENCES `WeeklyMap`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
