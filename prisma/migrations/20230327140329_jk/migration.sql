/*
  Warnings:

  - You are about to alter the column `name` on the `SpawnOneAction` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to alter the column `name` on the `SpawnThreeAction` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to alter the column `name` on the `SpawnTwoAction` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.

*/
-- AlterTable
ALTER TABLE `SpawnOneAction` MODIFY `name` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `SpawnThreeAction` MODIFY `name` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `SpawnTwoAction` MODIFY `name` INTEGER NOT NULL;
