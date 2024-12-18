-- AlterEnum
ALTER TYPE "Size" ADD VALUE 'SIZENOTREQUIRED';

-- CreateTable
CREATE TABLE "UserAccessories" (
    "id" STRING NOT NULL,
    "userId" STRING NOT NULL,
    "imageUrl" STRING NOT NULL,
    "accessoryType" STRING NOT NULL,
    "accessoryName" STRING NOT NULL,
    "accessoryColor" "Color" NOT NULL,
    "accessorySize" "Size" NOT NULL,

    CONSTRAINT "UserAccessories_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "UserAccessories" ADD CONSTRAINT "UserAccessories_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
