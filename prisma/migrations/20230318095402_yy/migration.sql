-- DropForeignKey
ALTER TABLE `Waves` DROP FOREIGN KEY `Waves_initialStateId_fkey`;

-- AddForeignKey
ALTER TABLE `Waves` ADD CONSTRAINT `Waves_initialStateId_fkey` FOREIGN KEY (`initialStateId`) REFERENCES `WeeklyRotation`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
