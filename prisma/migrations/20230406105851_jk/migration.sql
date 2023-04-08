/*
  Warnings:

  - Made the column `weeklyMapId` on table `WeeklyRotation` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `WeeklyRotation` DROP FOREIGN KEY `WeeklyRotation_weeklyMapId_fkey`;

-- AlterTable
ALTER TABLE `WeeklyRotation` MODIFY `weeklyMapId` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `WeeklyRotation` ADD CONSTRAINT `WeeklyRotation_weeklyMapId_fkey` FOREIGN KEY (`weeklyMapId`) REFERENCES `WeeklyMap`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
