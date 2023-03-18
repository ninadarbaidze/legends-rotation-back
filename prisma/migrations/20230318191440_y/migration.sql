/*
  Warnings:

  - Added the required column `color` to the `SpawnOneClasses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `image` to the `SpawnOneClasses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `title` to the `SpawnOneClasses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `color` to the `SpawnThreeClasses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `image` to the `SpawnThreeClasses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `title` to the `SpawnThreeClasses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `color` to the `SpawnTwoClasses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `image` to the `SpawnTwoClasses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `title` to the `SpawnTwoClasses` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `SpawnOneClasses` ADD COLUMN `color` VARCHAR(191) NOT NULL,
    ADD COLUMN `image` VARCHAR(191) NOT NULL,
    ADD COLUMN `title` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `SpawnThreeClasses` ADD COLUMN `color` VARCHAR(191) NOT NULL,
    ADD COLUMN `image` VARCHAR(191) NOT NULL,
    ADD COLUMN `title` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `SpawnTwoClasses` ADD COLUMN `color` VARCHAR(191) NOT NULL,
    ADD COLUMN `image` VARCHAR(191) NOT NULL,
    ADD COLUMN `title` VARCHAR(191) NOT NULL;
