/*
  Warnings:

  - You are about to drop the column `color` on the `SpawnOneClasses` table. All the data in the column will be lost.
  - You are about to drop the column `image` on the `SpawnOneClasses` table. All the data in the column will be lost.
  - You are about to drop the column `title` on the `SpawnOneClasses` table. All the data in the column will be lost.
  - You are about to drop the column `color` on the `SpawnThreeClasses` table. All the data in the column will be lost.
  - You are about to drop the column `image` on the `SpawnThreeClasses` table. All the data in the column will be lost.
  - You are about to drop the column `title` on the `SpawnThreeClasses` table. All the data in the column will be lost.
  - You are about to drop the column `color` on the `SpawnTwoClasses` table. All the data in the column will be lost.
  - You are about to drop the column `image` on the `SpawnTwoClasses` table. All the data in the column will be lost.
  - You are about to drop the column `title` on the `SpawnTwoClasses` table. All the data in the column will be lost.
  - Added the required column `classId` to the `InitialClasses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `classId` to the `SpawnOneClasses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `classId` to the `SpawnThreeClasses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `classId` to the `SpawnTwoClasses` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `InitialClasses` ADD COLUMN `classId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `SpawnOneClasses` DROP COLUMN `color`,
    DROP COLUMN `image`,
    DROP COLUMN `title`,
    ADD COLUMN `classId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `SpawnThreeClasses` DROP COLUMN `color`,
    DROP COLUMN `image`,
    DROP COLUMN `title`,
    ADD COLUMN `classId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `SpawnTwoClasses` DROP COLUMN `color`,
    DROP COLUMN `image`,
    DROP COLUMN `title`,
    ADD COLUMN `classId` INTEGER NOT NULL;
