/*
  Warnings:

  - You are about to drop the column `Value` on the `transactions` table. All the data in the column will be lost.
  - Added the required column `value` to the `transactions` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "transactions" DROP COLUMN "Value",
ADD COLUMN     "value" DOUBLE PRECISION NOT NULL;
