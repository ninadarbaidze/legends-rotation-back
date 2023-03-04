/*
  Warnings:

  - You are about to drop the column `spawnTwoId` on the `Classes` table. All the data in the column will be lost.
  - Added the required column `spawnTwo` to the `Classes` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Classes` DROP FOREIGN KEY `Classes_spawnTwoId_fkey`;

-- AlterTable
ALTER TABLE `Classes` DROP COLUMN `spawnTwoId`,
    ADD COLUMN `spawnTwo` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Classes` ADD CONSTRAINT `Classes_spawnTwo_fkey` FOREIGN KEY (`spawnTwo`) REFERENCES `Spawn2`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
