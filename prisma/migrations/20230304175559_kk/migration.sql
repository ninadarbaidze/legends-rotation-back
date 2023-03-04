/*
  Warnings:

  - You are about to drop the column `spawnThreeId` on the `Classes` table. All the data in the column will be lost.
  - Added the required column `spawnThree` to the `Classes` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Classes` DROP FOREIGN KEY `Classes_spawnThreeId_fkey`;

-- AlterTable
ALTER TABLE `Classes` DROP COLUMN `spawnThreeId`,
    ADD COLUMN `spawnThree` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Classes` ADD CONSTRAINT `Classes_spawnThree_fkey` FOREIGN KEY (`spawnThree`) REFERENCES `Spawn3`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
