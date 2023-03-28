-- CreateTable
CREATE TABLE `Objective` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` INTEGER NOT NULL,
    `waveId` INTEGER NOT NULL,

    UNIQUE INDEX `Objective_waveId_key`(`waveId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Objective` ADD CONSTRAINT `Objective_waveId_fkey` FOREIGN KEY (`waveId`) REFERENCES `Waves`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
