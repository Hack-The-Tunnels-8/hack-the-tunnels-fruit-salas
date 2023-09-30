-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Product" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "price" REAL NOT NULL,
    "imageUrl" TEXT,
    "review" TEXT NOT NULL DEFAULT 'Test Review',
    "rating" INTEGER NOT NULL DEFAULT 0
);
INSERT INTO "new_Product" ("description", "id", "imageUrl", "price", "rating", "review", "title") SELECT "description", "id", "imageUrl", "price", "rating", coalesce("review", 'Test Review') AS "review", "title" FROM "Product";
DROP TABLE "Product";
ALTER TABLE "new_Product" RENAME TO "Product";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
