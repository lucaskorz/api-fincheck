/*
  Warnings:

  - You are about to drop the column `userId` on the `bank_accounts` table. All the data in the column will be lost.
  - Added the required column `user_id` to the `bank_accounts` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "transaction_type" AS ENUM ('INCOME', 'EXPENSE');

-- DropForeignKey
ALTER TABLE "bank_accounts" DROP CONSTRAINT "bank_accounts_userId_fkey";

-- AlterTable
ALTER TABLE "bank_accounts" DROP COLUMN "userId",
ADD COLUMN     "user_id" UUID NOT NULL;

-- CreateTable
CREATE TABLE "Category" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "icon" TEXT NOT NULL,
    "type" "transaction_type" NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "bank_accounts" ADD CONSTRAINT "bank_accounts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Category" ADD CONSTRAINT "Category_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
