-- CreateTable
CREATE TABLE `WeeklyRotation` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `InitialState` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `author` VARCHAR(191) NOT NULL,
    `date` VARCHAR(191) NOT NULL,
    `version` VARCHAR(191) NOT NULL,
    `weeklyModifier` VARCHAR(191) NOT NULL,
    `isPublic` BOOLEAN NOT NULL DEFAULT false,
    `weeklyRotationId` INTEGER NOT NULL,

    UNIQUE INDEX `InitialState_weeklyRotationId_key`(`weeklyRotationId`),
    INDEX `InitialState_weeklyRotationId_idx`(`weeklyRotationId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `InitialClasses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `classId` INTEGER NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `image` VARCHAR(191) NOT NULL,
    `color` VARCHAR(191) NOT NULL,
    `initialStateId` INTEGER NOT NULL,

    INDEX `InitialClasses_initialStateId_idx`(`initialStateId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Waves` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `initialStateId` INTEGER NOT NULL,

    INDEX `Waves_initialStateId_idx`(`initialStateId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Objective` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` INTEGER NOT NULL,
    `waveId` INTEGER NOT NULL,

    UNIQUE INDEX `Objective_waveId_key`(`waveId`),
    INDEX `Objective_waveId_idx`(`waveId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Spawn1` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `spawnLocation` VARCHAR(191) NOT NULL,
    `waveId` INTEGER NOT NULL,

    UNIQUE INDEX `Spawn1_waveId_key`(`waveId`),
    INDEX `Spawn1_waveId_idx`(`waveId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Spawn2` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `spawnLocation` VARCHAR(191) NOT NULL,
    `waveId` INTEGER NOT NULL,

    UNIQUE INDEX `Spawn2_waveId_key`(`waveId`),
    INDEX `Spawn2_waveId_idx`(`waveId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Spawn3` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `spawnLocation` VARCHAR(191) NOT NULL,
    `waveId` INTEGER NOT NULL,

    UNIQUE INDEX `Spawn3_waveId_key`(`waveId`),
    INDEX `Spawn3_waveId_idx`(`waveId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnOneAction` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` INTEGER NOT NULL,
    `spawn1Id` INTEGER NOT NULL,

    INDEX `SpawnOneAction_spawn1Id_idx`(`spawn1Id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnTwoAction` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` INTEGER NOT NULL,
    `spawn2Id` INTEGER NOT NULL,

    INDEX `SpawnTwoAction_spawn2Id_idx`(`spawn2Id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnThreeAction` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` INTEGER NOT NULL,
    `spawn3Id` INTEGER NOT NULL,

    INDEX `SpawnThreeAction_spawn3Id_idx`(`spawn3Id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnOneClasses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `classId` INTEGER NOT NULL,
    `spawn1Id` INTEGER NOT NULL,

    INDEX `SpawnOneClasses_spawn1Id_idx`(`spawn1Id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnTwoClasses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `classId` INTEGER NOT NULL,
    `spawn2Id` INTEGER NOT NULL,

    INDEX `SpawnTwoClasses_spawn2Id_idx`(`spawn2Id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnThreeClasses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `classId` INTEGER NOT NULL,
    `spawn3Id` INTEGER NOT NULL,

    INDEX `SpawnThreeClasses_spawn3Id_idx`(`spawn3Id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `WeeklyMap` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `WeeklyMap_title_key`(`title`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Locations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `location` VARCHAR(191) NOT NULL,
    `weeklyMapId` INTEGER NOT NULL,

    INDEX `Locations_weeklyMapId_idx`(`weeklyMapId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `InitialState` ADD CONSTRAINT `InitialState_weeklyRotationId_fkey` FOREIGN KEY (`weeklyRotationId`) REFERENCES `WeeklyRotation`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InitialClasses` ADD CONSTRAINT `InitialClasses_initialStateId_fkey` FOREIGN KEY (`initialStateId`) REFERENCES `InitialState`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Waves` ADD CONSTRAINT `Waves_initialStateId_fkey` FOREIGN KEY (`initialStateId`) REFERENCES `WeeklyRotation`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Objective` ADD CONSTRAINT `Objective_waveId_fkey` FOREIGN KEY (`waveId`) REFERENCES `Waves`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Spawn1` ADD CONSTRAINT `Spawn1_waveId_fkey` FOREIGN KEY (`waveId`) REFERENCES `Waves`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Spawn2` ADD CONSTRAINT `Spawn2_waveId_fkey` FOREIGN KEY (`waveId`) REFERENCES `Waves`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Spawn3` ADD CONSTRAINT `Spawn3_waveId_fkey` FOREIGN KEY (`waveId`) REFERENCES `Waves`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnOneAction` ADD CONSTRAINT `SpawnOneAction_spawn1Id_fkey` FOREIGN KEY (`spawn1Id`) REFERENCES `Spawn1`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnTwoAction` ADD CONSTRAINT `SpawnTwoAction_spawn2Id_fkey` FOREIGN KEY (`spawn2Id`) REFERENCES `Spawn2`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnThreeAction` ADD CONSTRAINT `SpawnThreeAction_spawn3Id_fkey` FOREIGN KEY (`spawn3Id`) REFERENCES `Spawn3`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnOneClasses` ADD CONSTRAINT `SpawnOneClasses_spawn1Id_fkey` FOREIGN KEY (`spawn1Id`) REFERENCES `Spawn1`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnTwoClasses` ADD CONSTRAINT `SpawnTwoClasses_spawn2Id_fkey` FOREIGN KEY (`spawn2Id`) REFERENCES `Spawn2`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnThreeClasses` ADD CONSTRAINT `SpawnThreeClasses_spawn3Id_fkey` FOREIGN KEY (`spawn3Id`) REFERENCES `Spawn3`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Locations` ADD CONSTRAINT `Locations_weeklyMapId_fkey` FOREIGN KEY (`weeklyMapId`) REFERENCES `WeeklyMap`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
