-- CreateTable
CREATE TABLE `Locations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `location` VARCHAR(191) NOT NULL,
    `mapId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Locations` ADD CONSTRAINT `Locations_mapId_fkey` FOREIGN KEY (`mapId`) REFERENCES `WeeklyMap`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
