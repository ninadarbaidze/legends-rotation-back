/*
  Warnings:

  - You are about to drop the `Locations` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Locations` DROP FOREIGN KEY `Locations_mapId_fkey`;

-- DropTable
DROP TABLE `Locations`;
