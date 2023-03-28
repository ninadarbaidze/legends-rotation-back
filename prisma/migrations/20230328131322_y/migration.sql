/*
  Warnings:

  - You are about to drop the column `objective` on the `Spawn1` table. All the data in the column will be lost.
  - You are about to drop the column `objective` on the `Spawn2` table. All the data in the column will be lost.
  - You are about to drop the column `objective` on the `Spawn3` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `Spawn1` DROP COLUMN `objective`;

-- AlterTable
ALTER TABLE `Spawn2` DROP COLUMN `objective`;

-- AlterTable
ALTER TABLE `Spawn3` DROP COLUMN `objective`;
