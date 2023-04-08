/*
  Warnings:

  - You are about to drop the column `weeklyMapId` on the `WeeklyRotation` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `WeeklyRotation` DROP FOREIGN KEY `WeeklyRotation_weeklyMapId_fkey`;

-- AlterTable
ALTER TABLE `WeeklyRotation` DROP COLUMN `weeklyMapId`;
