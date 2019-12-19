#!/bin/bash

echo "Exporting corrupted catalog..."
echo .dump | sqlite3 $1 > tmp_sqlexport_lrcat.sql

echo "Fixing catalog..."
tail -n 1 tmp_sqlexport_lrcat.sql | wc -c | xargs -I {} truncate tmp_sqlexport_lrcat.sql -s -{}
echo "COMMIT TRANSACTION;" >> tmp_sqlexport_lrcat.sql

echo "Creating fixed catalog..."
echo .quit | sqlite3 -init tmp_sqlexport_lrcat.sql $1.fixed.lrcat > /dev/null 2>&1

echo "Cleanup temporary data..."
rm tmp_sqlexport_lrcat.sql

echo "Done."
echo "Your new catalog is: $1.fixed.lrcat"
echo "Corrupted catalog $1 has not been altered"
echo "Enjoy!"
