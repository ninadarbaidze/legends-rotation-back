/*
  Warnings:

  - A unique constraint covering the columns `[weeklyMapId]` on the table `Locations` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Locations_weeklyMapId_key` ON `Locations`(`weeklyMapId`);
