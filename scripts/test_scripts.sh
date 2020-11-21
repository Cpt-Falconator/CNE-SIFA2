#!/bin/bash

rm -r CNE-SIFA2/
git clone "https://github.com/Cpt-Falconator/CNE-SIFA2.git"
cd CNE-SIFA2/
mysql -h testing-db.c3up5hij9k9x.eu-west-1.rds.amazonaws.com -P 3306 -u FalconTest -pMWAMDATABASE < database/Create.sql
docker-compose up -d --build
docker exec backend bash -c "pytest tests/ --cov application"
docker exec frontend bash -c "pytest tests/ --cov application"
docker-compose down
cd ..
rm -r CNE-SIFA2/
