/*
  Warnings:

  - You are about to drop the column `intiateUserId` on the `AccessoryChat` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `UserPreference` table. All the data in the column will be lost.
  - Added the required column `initiateUserId` to the `AccessoryChat` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userAttributesId` to the `UserPreference` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "AccessoryChat" DROP CONSTRAINT "AccessoryChat_intiateUserId_fkey";

-- DropForeignKey
ALTER TABLE "UserPreference" DROP CONSTRAINT "UserPreference_userId_fkey";

-- AlterTable
ALTER TABLE "AccessoryChat" DROP COLUMN "intiateUserId",
ADD COLUMN     "initiateUserId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "ExchangeHistory" ALTER COLUMN "user1Review" DROP NOT NULL,
ALTER COLUMN "user1Review" DROP DEFAULT,
ALTER COLUMN "user2Review" DROP NOT NULL,
ALTER COLUMN "user2Review" DROP DEFAULT,
ALTER COLUMN "user1Rating" DROP NOT NULL,
ALTER COLUMN "user1Rating" DROP DEFAULT,
ALTER COLUMN "user2Rating" DROP NOT NULL,
ALTER COLUMN "user2Rating" DROP DEFAULT;

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "phoneNumber" DROP NOT NULL,
ALTER COLUMN "phoneNumber" DROP DEFAULT,
ALTER COLUMN "phoneNumber" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "UserPreference" DROP COLUMN "userId",
ADD COLUMN     "userAttributesId" TEXT NOT NULL,
ALTER COLUMN "type" DROP DEFAULT,
ALTER COLUMN "preferedColor" DROP DEFAULT;

-- AddForeignKey
ALTER TABLE "AccessoryChat" ADD CONSTRAINT "AccessoryChat_initiateUserId_fkey" FOREIGN KEY ("initiateUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserPreference" ADD CONSTRAINT "UserPreference_userAttributesId_fkey" FOREIGN KEY ("userAttributesId") REFERENCES "UserAttributes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
