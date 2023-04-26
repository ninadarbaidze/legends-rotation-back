/*
  Warnings:

  - You are about to alter the column `classId` on the `InitialClasses` table. The data in that column could be lost. The data in that column will be cast from `Int` to `TinyInt`.
  - You are about to alter the column `objective` on the `Wave` table. The data in that column could be lost. The data in that column will be cast from `Int` to `TinyInt`.

*/
-- AlterTable
ALTER TABLE `InitialClasses` MODIFY `classId` TINYINT NOT NULL,
    MODIFY `title` TINYTEXT NOT NULL,
    MODIFY `color` TINYTEXT NOT NULL;

-- AlterTable
ALTER TABLE `InitialState` MODIFY `author` TINYTEXT NOT NULL,
    MODIFY `weeklyModifier` TINYTEXT NOT NULL;

-- AlterTable
ALTER TABLE `Locations` MODIFY `location` TINYTEXT NOT NULL;

-- AlterTable
ALTER TABLE `Spawn` MODIFY `spawnLocation` TINYTEXT NOT NULL;

-- AlterTable
ALTER TABLE `Wave` MODIFY `objective` TINYINT NULL;
