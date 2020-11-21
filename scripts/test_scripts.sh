#!/bin/bash

git clone "https://github.com/Cpt-Falconator/CNE-SIFA2.git"
cd CNE-SIFA2/
mysql -h ${T_DB_END} -P 3306 -u ${T_DB_USERNAME} -p${T_DB_PASSWORD} < database/Create.sql
docker-compose up -d --build
docker exec backend bash -c "pytest tests/ --cov application"
docker exec frontend bash -c "pytest tests/ --cov application"
docker-compose down
cd ..
rm -r CNE-SIFA2/
