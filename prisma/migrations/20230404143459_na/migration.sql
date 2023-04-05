/*
  Warnings:

  - You are about to drop the column `initialStateId` on the `WeeklyRotation` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX `WeeklyRotation_initialStateId_key` ON `WeeklyRotation`;

-- AlterTable
ALTER TABLE `WeeklyRotation` DROP COLUMN `initialStateId`;
