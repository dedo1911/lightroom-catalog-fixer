# Lightroom Catalog Fixer
  Fix Lightroom corrupted catalogs

## Usage
  `./fix.sh CatalogFile.lrcat`
 
 ## How it works?
   Adobe Lightroom catalogs are SQLite3 databases stored with .lrcat file extension.
   This script exports the database as SQL commands then executes exported commands against a brand new database (ignoring a few - usually unrelated - errors).
   Newly generated database is going to be your new Catalog file, that will hopefully works.
   This script does not alter in any way your original catalog.
   
