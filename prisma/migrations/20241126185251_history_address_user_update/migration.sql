-- AlterTable
ALTER TABLE "User" ADD COLUMN     "phoneNumber" INT8 NOT NULL DEFAULT 0;

-- CreateTable
CREATE TABLE "UserAddress" (
    "id" STRING NOT NULL,
    "userId" STRING NOT NULL,
    "city" STRING NOT NULL,
    "state" STRING NOT NULL,
    "country" STRING NOT NULL,
    "street" STRING NOT NULL,
    "pinCode" STRING NOT NULL,
    "landmark" STRING NOT NULL,

    CONSTRAINT "UserAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExchangeHistory" (
    "id" STRING NOT NULL,
    "user1Id" STRING NOT NULL,
    "user2Id" STRING NOT NULL,
    "description" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ExchangeHistory_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UserAddress_userId_key" ON "UserAddress"("userId");

-- AddForeignKey
ALTER TABLE "UserAddress" ADD CONSTRAINT "UserAddress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExchangeHistory" ADD CONSTRAINT "ExchangeHistory_user1Id_fkey" FOREIGN KEY ("user1Id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExchangeHistory" ADD CONSTRAINT "ExchangeHistory_user2Id_fkey" FOREIGN KEY ("user2Id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
