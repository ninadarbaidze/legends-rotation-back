-- DropForeignKey
ALTER TABLE `WeeklyRotation` DROP FOREIGN KEY `WeeklyRotation_weeklyMapId_fkey`;

-- AlterTable
ALTER TABLE `Locations` ALTER COLUMN `weeklyMapId` DROP DEFAULT;

-- AlterTable
ALTER TABLE `WeeklyRotation` MODIFY `weeklyMapId` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `WeeklyRotation` ADD CONSTRAINT `WeeklyRotation_weeklyMapId_fkey` FOREIGN KEY (`weeklyMapId`) REFERENCES `WeeklyMap`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
