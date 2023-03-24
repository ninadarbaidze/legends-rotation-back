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
    `weeklyRotationId` INTEGER NOT NULL,

    UNIQUE INDEX `InitialState_weeklyRotationId_key`(`weeklyRotationId`),
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

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Waves` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `initialStateId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Spawn1` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `spawnLocation` VARCHAR(191) NOT NULL,
    `objective` VARCHAR(191) NULL,
    `waveId` INTEGER NOT NULL,

    UNIQUE INDEX `Spawn1_waveId_key`(`waveId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Spawn2` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `spawnLocation` VARCHAR(191) NOT NULL,
    `objective` VARCHAR(191) NULL,
    `waveId` INTEGER NOT NULL,

    UNIQUE INDEX `Spawn2_waveId_key`(`waveId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Spawn3` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `spawnLocation` VARCHAR(191) NOT NULL,
    `objective` VARCHAR(191) NULL,
    `waveId` INTEGER NOT NULL,

    UNIQUE INDEX `Spawn3_waveId_key`(`waveId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Action` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `spawn1Id` INTEGER NOT NULL,
    `spawn2Id` INTEGER NOT NULL,
    `spawn3Id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnOneClasses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `classId` INTEGER NOT NULL,
    `spawn1Id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnTwoClasses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `classId` INTEGER NOT NULL,
    `spawn2Id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnThreeClasses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `classId` INTEGER NOT NULL,
    `spawn3Id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `InitialState` ADD CONSTRAINT `InitialState_weeklyRotationId_fkey` FOREIGN KEY (`weeklyRotationId`) REFERENCES `WeeklyRotation`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InitialClasses` ADD CONSTRAINT `InitialClasses_initialStateId_fkey` FOREIGN KEY (`initialStateId`) REFERENCES `InitialState`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Waves` ADD CONSTRAINT `Waves_initialStateId_fkey` FOREIGN KEY (`initialStateId`) REFERENCES `WeeklyRotation`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Spawn1` ADD CONSTRAINT `Spawn1_waveId_fkey` FOREIGN KEY (`waveId`) REFERENCES `Waves`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Spawn2` ADD CONSTRAINT `Spawn2_waveId_fkey` FOREIGN KEY (`waveId`) REFERENCES `Waves`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Spawn3` ADD CONSTRAINT `Spawn3_waveId_fkey` FOREIGN KEY (`waveId`) REFERENCES `Waves`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Action` ADD CONSTRAINT `Action_spawn1Id_fkey` FOREIGN KEY (`spawn1Id`) REFERENCES `Spawn1`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Action` ADD CONSTRAINT `Action_spawn2Id_fkey` FOREIGN KEY (`spawn2Id`) REFERENCES `Spawn2`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Action` ADD CONSTRAINT `Action_spawn3Id_fkey` FOREIGN KEY (`spawn3Id`) REFERENCES `Spawn3`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnOneClasses` ADD CONSTRAINT `SpawnOneClasses_spawn1Id_fkey` FOREIGN KEY (`spawn1Id`) REFERENCES `Spawn1`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnTwoClasses` ADD CONSTRAINT `SpawnTwoClasses_spawn2Id_fkey` FOREIGN KEY (`spawn2Id`) REFERENCES `Spawn2`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnThreeClasses` ADD CONSTRAINT `SpawnThreeClasses_spawn3Id_fkey` FOREIGN KEY (`spawn3Id`) REFERENCES `Spawn3`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
