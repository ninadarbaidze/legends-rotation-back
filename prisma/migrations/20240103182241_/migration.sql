-- CreateTable
CREATE TABLE `WeeklyMap` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NOT NULL,
    `mapId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Locations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `location` TINYTEXT NOT NULL,
    `mapId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `WeeklyRotation` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `weeklyMapId` INTEGER NOT NULL,

    UNIQUE INDEX `WeeklyRotation_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `InitialState` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `author` TINYTEXT NOT NULL,
    `date` VARCHAR(191) NOT NULL,
    `version` VARCHAR(191) NOT NULL,
    `weeklyModifier` TINYTEXT NOT NULL,
    `isPublic` BOOLEAN NOT NULL DEFAULT false,
    `weeklyRotationId` INTEGER NOT NULL,

    UNIQUE INDEX `InitialState_weeklyRotationId_key`(`weeklyRotationId`),
    INDEX `InitialState_weeklyRotationId_idx`(`weeklyRotationId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `InitialClasses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `classId` TINYINT NOT NULL,
    `title` TINYTEXT NOT NULL,
    `image` VARCHAR(191) NOT NULL,
    `color` TINYTEXT NOT NULL,
    `initialStateId` INTEGER NOT NULL,

    INDEX `InitialClasses_initialStateId_idx`(`initialStateId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Wave` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `weeklyRotationId` INTEGER NOT NULL,
    `objective` TINYINT NULL,
    `comment` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Spawn` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `spawnLocation` TINYTEXT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `WavesOnSpawns` (
    `waveId` INTEGER NOT NULL,
    `spawnId` INTEGER NOT NULL,

    PRIMARY KEY (`waveId`, `spawnId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Action` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnsOnAction` (
    `spawnId` INTEGER NOT NULL,
    `actionId` INTEGER NOT NULL,

    PRIMARY KEY (`spawnId`, `actionId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Classes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `classId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnsOnClasses` (
    `spawnId` INTEGER NOT NULL,
    `classId` INTEGER NOT NULL,

    PRIMARY KEY (`spawnId`, `classId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Locations` ADD CONSTRAINT `Locations_mapId_fkey` FOREIGN KEY (`mapId`) REFERENCES `WeeklyMap`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WeeklyRotation` ADD CONSTRAINT `WeeklyRotation_weeklyMapId_fkey` FOREIGN KEY (`weeklyMapId`) REFERENCES `WeeklyMap`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InitialState` ADD CONSTRAINT `InitialState_weeklyRotationId_fkey` FOREIGN KEY (`weeklyRotationId`) REFERENCES `WeeklyRotation`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InitialClasses` ADD CONSTRAINT `InitialClasses_initialStateId_fkey` FOREIGN KEY (`initialStateId`) REFERENCES `InitialState`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Wave` ADD CONSTRAINT `Wave_weeklyRotationId_fkey` FOREIGN KEY (`weeklyRotationId`) REFERENCES `WeeklyRotation`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WavesOnSpawns` ADD CONSTRAINT `WavesOnSpawns_waveId_fkey` FOREIGN KEY (`waveId`) REFERENCES `Wave`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WavesOnSpawns` ADD CONSTRAINT `WavesOnSpawns_spawnId_fkey` FOREIGN KEY (`spawnId`) REFERENCES `Spawn`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnsOnAction` ADD CONSTRAINT `SpawnsOnAction_spawnId_fkey` FOREIGN KEY (`spawnId`) REFERENCES `Spawn`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnsOnAction` ADD CONSTRAINT `SpawnsOnAction_actionId_fkey` FOREIGN KEY (`actionId`) REFERENCES `Action`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnsOnClasses` ADD CONSTRAINT `SpawnsOnClasses_spawnId_fkey` FOREIGN KEY (`spawnId`) REFERENCES `Spawn`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnsOnClasses` ADD CONSTRAINT `SpawnsOnClasses_classId_fkey` FOREIGN KEY (`classId`) REFERENCES `Classes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
