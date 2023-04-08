/*
  Warnings:

  - Added the required column `weeklyMapId` to the `WeeklyRotation` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `WeeklyRotation` ADD COLUMN `weeklyMapId` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `WeeklyRotation` ADD CONSTRAINT `WeeklyRotation_weeklyMapId_fkey` FOREIGN KEY (`weeklyMapId`) REFERENCES `WeeklyMap`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
