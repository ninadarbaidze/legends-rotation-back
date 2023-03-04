-- CreateTable
CREATE TABLE `Users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NULL,

    UNIQUE INDEX `Users_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Profile` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `bio` VARCHAR(191) NOT NULL,
    `userId` INTEGER NOT NULL,

    UNIQUE INDEX `Profile_userId_key`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Post` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `title` VARCHAR(191) NOT NULL,
    `published` BOOLEAN NOT NULL DEFAULT false,
    `authorId` INTEGER NOT NULL,

    INDEX `Post_authorId_fkey`(`authorId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CategoriesOnPosts` (
    `postId` INTEGER NOT NULL,
    `categoryId` INTEGER NOT NULL,
    `assignedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `assignedBy` VARCHAR(191) NOT NULL,

    INDEX `CategoriesOnPosts_categoryId_fkey`(`categoryId`),
    PRIMARY KEY (`postId`, `categoryId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Category` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

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
CREATE TABLE `Classes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NOT NULL,
    `image` VARCHAR(191) NOT NULL,
    `color` VARCHAR(191) NOT NULL,
    `spawn1Id` INTEGER NOT NULL,
    `spawn2Id` INTEGER NOT NULL,
    `spawn3Id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Profile` ADD CONSTRAINT `Profile_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Post` ADD CONSTRAINT `Post_authorId_fkey` FOREIGN KEY (`authorId`) REFERENCES `Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CategoriesOnPosts` ADD CONSTRAINT `CategoriesOnPosts_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CategoriesOnPosts` ADD CONSTRAINT `CategoriesOnPosts_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `Post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InitialState` ADD CONSTRAINT `InitialState_weeklyRotationId_fkey` FOREIGN KEY (`weeklyRotationId`) REFERENCES `WeeklyRotation`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InitialClasses` ADD CONSTRAINT `InitialClasses_initialStateId_fkey` FOREIGN KEY (`initialStateId`) REFERENCES `InitialState`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Waves` ADD CONSTRAINT `Waves_initialStateId_fkey` FOREIGN KEY (`initialStateId`) REFERENCES `InitialState`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

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
ALTER TABLE `Classes` ADD CONSTRAINT `Classes_spawn1Id_fkey` FOREIGN KEY (`spawn1Id`) REFERENCES `Spawn1`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Classes` ADD CONSTRAINT `Classes_spawn2Id_fkey` FOREIGN KEY (`spawn2Id`) REFERENCES `Spawn2`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Classes` ADD CONSTRAINT `Classes_spawn3Id_fkey` FOREIGN KEY (`spawn3Id`) REFERENCES `Spawn3`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
