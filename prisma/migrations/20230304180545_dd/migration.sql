/*
  Warnings:

  - You are about to drop the `Classes` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Classes` DROP FOREIGN KEY `Classes_spawn1Id_fkey`;

-- DropForeignKey
ALTER TABLE `Classes` DROP FOREIGN KEY `Classes_spawnThree_fkey`;

-- DropForeignKey
ALTER TABLE `Classes` DROP FOREIGN KEY `Classes_spawnTwo_fkey`;

-- DropTable
DROP TABLE `Classes`;

-- CreateTable
CREATE TABLE `SpawnOneClasses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NOT NULL,
    `image` VARCHAR(191) NOT NULL,
    `color` VARCHAR(191) NOT NULL,
    `spawn1Id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnTwoClasses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NOT NULL,
    `image` VARCHAR(191) NOT NULL,
    `color` VARCHAR(191) NOT NULL,
    `spawn2Id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnThreeClasses` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NOT NULL,
    `image` VARCHAR(191) NOT NULL,
    `color` VARCHAR(191) NOT NULL,
    `spawn3Id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `SpawnOneClasses` ADD CONSTRAINT `SpawnOneClasses_spawn1Id_fkey` FOREIGN KEY (`spawn1Id`) REFERENCES `Spawn1`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnTwoClasses` ADD CONSTRAINT `SpawnTwoClasses_spawn2Id_fkey` FOREIGN KEY (`spawn2Id`) REFERENCES `Spawn2`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnThreeClasses` ADD CONSTRAINT `SpawnThreeClasses_spawn3Id_fkey` FOREIGN KEY (`spawn3Id`) REFERENCES `Spawn3`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
