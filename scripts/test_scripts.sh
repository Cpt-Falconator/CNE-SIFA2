#!/bin/bash

rm -f CNE-SIFA2/
git clone "https://github.com/Cpt-Falconator/CNE-SIFA2.git"
cd /home/ubuntu/CNE-SIFA2/
mysql -h testing-db.c3up5hij9k9x.eu-west-1.rds.amazonaws.com -P 3306 -u ${T_DB_USERNAME} -p${T_DB_PASSWORD} < database/Create.sql
mysql -h ${DB_END} -P 3306 -u ${DB_USERNAME} -p${DB_PASSWORD} < database/Create.sql
sudo docker-compose up -d --build
docker exec backend bash -c "pytest tests/ --cov application"
docker exec frontend bash -c "pytest tests/ --cov application"
sudo docker-compose down
