-- CreateTable
CREATE TABLE `SavedScheme` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `schemeId` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `SavedScheme_userId_schemeId_key`(`userId`, `schemeId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `SavedScheme` ADD CONSTRAINT `SavedScheme_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SavedScheme` ADD CONSTRAINT `SavedScheme_schemeId_fkey` FOREIGN KEY (`schemeId`) REFERENCES `Scheme`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
