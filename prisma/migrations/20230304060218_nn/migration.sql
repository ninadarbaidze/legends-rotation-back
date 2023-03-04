/*
  Warnings:

  - You are about to drop the column `spawn2Id` on the `Classes` table. All the data in the column will be lost.
  - You are about to drop the column `spawn3Id` on the `Classes` table. All the data in the column will be lost.
  - Added the required column `spawnThreeId` to the `Classes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `spawnTwoId` to the `Classes` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Classes` DROP FOREIGN KEY `Classes_spawn2Id_fkey`;

-- DropForeignKey
ALTER TABLE `Classes` DROP FOREIGN KEY `Classes_spawn3Id_fkey`;

-- AlterTable
ALTER TABLE `Classes` DROP COLUMN `spawn2Id`,
    DROP COLUMN `spawn3Id`,
    ADD COLUMN `spawnThreeId` INTEGER NOT NULL,
    ADD COLUMN `spawnTwoId` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Classes` ADD CONSTRAINT `Classes_spawnTwoId_fkey` FOREIGN KEY (`spawnTwoId`) REFERENCES `Spawn2`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Classes` ADD CONSTRAINT `Classes_spawnThreeId_fkey` FOREIGN KEY (`spawnThreeId`) REFERENCES `Spawn3`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
