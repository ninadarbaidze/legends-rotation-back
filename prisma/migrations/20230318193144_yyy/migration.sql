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

*/
-- AlterTable
ALTER TABLE `SpawnOneClasses` DROP COLUMN `color`,
    DROP COLUMN `image`,
    DROP COLUMN `title`;

-- AlterTable
ALTER TABLE `SpawnThreeClasses` DROP COLUMN `color`,
    DROP COLUMN `image`,
    DROP COLUMN `title`;

-- AlterTable
ALTER TABLE `SpawnTwoClasses` DROP COLUMN `color`,
    DROP COLUMN `image`,
    DROP COLUMN `title`;
