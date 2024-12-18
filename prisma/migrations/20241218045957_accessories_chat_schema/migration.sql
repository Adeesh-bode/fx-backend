-- CreateTable
CREATE TABLE "AccessoryChat" (
    "id" STRING NOT NULL,
    "accessoryId" STRING NOT NULL,
    "intiateUserId" STRING NOT NULL,
    "receivedUserId" STRING NOT NULL,
    "message" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AccessoryChat_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "AccessoryChat" ADD CONSTRAINT "AccessoryChat_accessoryId_fkey" FOREIGN KEY ("accessoryId") REFERENCES "Accessory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AccessoryChat" ADD CONSTRAINT "AccessoryChat_intiateUserId_fkey" FOREIGN KEY ("intiateUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AccessoryChat" ADD CONSTRAINT "AccessoryChat_receivedUserId_fkey" FOREIGN KEY ("receivedUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
