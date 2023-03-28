/*
  Warnings:

  - You are about to drop the `Action` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Action` DROP FOREIGN KEY `Action_spawn1Id_fkey`;

-- DropForeignKey
ALTER TABLE `Action` DROP FOREIGN KEY `Action_spawn2Id_fkey`;

-- DropForeignKey
ALTER TABLE `Action` DROP FOREIGN KEY `Action_spawn3Id_fkey`;

-- DropTable
DROP TABLE `Action`;

-- CreateTable
CREATE TABLE `SpawnOneAction` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `spawn1Id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnTwoAction` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `spawn2Id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SpawnThreeAction` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `spawn1Id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `SpawnOneAction` ADD CONSTRAINT `SpawnOneAction_spawn1Id_fkey` FOREIGN KEY (`spawn1Id`) REFERENCES `Spawn1`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnTwoAction` ADD CONSTRAINT `SpawnTwoAction_spawn2Id_fkey` FOREIGN KEY (`spawn2Id`) REFERENCES `Spawn2`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SpawnThreeAction` ADD CONSTRAINT `SpawnThreeAction_spawn1Id_fkey` FOREIGN KEY (`spawn1Id`) REFERENCES `Spawn3`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
