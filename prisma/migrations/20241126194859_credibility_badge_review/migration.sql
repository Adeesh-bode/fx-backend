-- CreateEnum
CREATE TYPE "BadgeName" AS ENUM ('MostHelpful', 'MostFriendly', 'MostActive', 'MostResponsive', 'MostTrustworthy');

-- CreateTable
CREATE TABLE "UserCredibility" (
    "id" STRING NOT NULL,
    "userId" STRING NOT NULL,
    "rating" FLOAT8 NOT NULL DEFAULT 3,

    CONSTRAINT "UserCredibility_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Badge" (
    "id" STRING NOT NULL,
    "userCredibilityId" STRING,
    "badgeType" STRING NOT NULL,
    "badgeLevel" STRING NOT NULL,
    "badgeName" "BadgeName" NOT NULL,
    "badgePoints" INT4 NOT NULL,

    CONSTRAINT "Badge_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Review" (
    "id" STRING NOT NULL,
    "reviewForuserId" STRING NOT NULL,
    "reviewerUserId" STRING NOT NULL,
    "review" STRING NOT NULL,
    "rating" FLOAT8 NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Review_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UserCredibility_userId_key" ON "UserCredibility"("userId");

-- AddForeignKey
ALTER TABLE "UserCredibility" ADD CONSTRAINT "UserCredibility_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Badge" ADD CONSTRAINT "Badge_userCredibilityId_fkey" FOREIGN KEY ("userCredibilityId") REFERENCES "UserCredibility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_reviewForuserId_fkey" FOREIGN KEY ("reviewForuserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_reviewerUserId_fkey" FOREIGN KEY ("reviewerUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
