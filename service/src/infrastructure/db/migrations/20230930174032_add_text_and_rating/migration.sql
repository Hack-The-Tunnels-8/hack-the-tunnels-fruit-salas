/*
  Warnings:

  - You are about to drop the `Reviews` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `rating` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `text` to the `Product` table without a default value. This is not possible if the table is not empty.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Reviews";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Product" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "price" REAL NOT NULL,
    "imageUrl" TEXT,
    "text" TEXT NOT NULL,
    "rating" INTEGER NOT NULL
);
INSERT INTO "new_Product" ("description", "id", "imageUrl", "price", "title") SELECT "description", "id", "imageUrl", "price", "title" FROM "Product";
DROP TABLE "Product";
ALTER TABLE "new_Product" RENAME TO "Product";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
