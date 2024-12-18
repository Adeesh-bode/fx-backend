/*
  Warnings:

  - You are about to drop the `UserAccessories` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `accessoryIdUser1` to the `ExchangeHistory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `accessoryIdUser2` to the `ExchangeHistory` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "UserAccessories" DROP CONSTRAINT "UserAccessories_userId_fkey";

-- AlterTable
ALTER TABLE "ExchangeHistory" ADD COLUMN     "accessoryIdUser1" STRING NOT NULL;
ALTER TABLE "ExchangeHistory" ADD COLUMN     "accessoryIdUser2" STRING NOT NULL;
ALTER TABLE "ExchangeHistory" ADD COLUMN     "user1Rating" FLOAT8 NOT NULL DEFAULT 5;
ALTER TABLE "ExchangeHistory" ADD COLUMN     "user1Review" STRING NOT NULL DEFAULT 'No Review';
ALTER TABLE "ExchangeHistory" ADD COLUMN     "user2Rating" FLOAT8 NOT NULL DEFAULT 5;
ALTER TABLE "ExchangeHistory" ADD COLUMN     "user2Review" STRING NOT NULL DEFAULT 'No Review';

-- DropTable
DROP TABLE "UserAccessories";

-- CreateTable
CREATE TABLE "Accessory" (
    "id" STRING NOT NULL,
    "userId" STRING NOT NULL,
    "imageUrl" STRING NOT NULL,
    "accessoryType" STRING NOT NULL,
    "accessoryName" STRING NOT NULL,
    "accessoryColor" "Color" NOT NULL,
    "accessorySize" "Size" NOT NULL,

    CONSTRAINT "Accessory_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Accessory" ADD CONSTRAINT "Accessory_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
