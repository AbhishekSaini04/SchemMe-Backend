/*
  Warnings:

  - You are about to drop the `savedscheme` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `savedscheme` DROP FOREIGN KEY `SavedScheme_schemeId_fkey`;

-- DropForeignKey
ALTER TABLE `savedscheme` DROP FOREIGN KEY `SavedScheme_userId_fkey`;

-- DropTable
DROP TABLE `savedscheme`;

-- CreateTable
CREATE TABLE `SavedSchemes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `schemeId` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `SavedSchemes_userId_schemeId_key`(`userId`, `schemeId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `SavedSchemes` ADD CONSTRAINT `SavedSchemes_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SavedSchemes` ADD CONSTRAINT `SavedSchemes_schemeId_fkey` FOREIGN KEY (`schemeId`) REFERENCES `Scheme`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
