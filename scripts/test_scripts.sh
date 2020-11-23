#!/bin/bash

rm -f CNE-SIFA2/
git clone "https://github.com/Cpt-Falconator/CNE-SIFA2.git"
cd /home/ubuntu/CNE-SIFA2/
mysql -h ${T_DB_END} -P 3306 -u ${T_DB_USERNAME} -p${DB_PASSWORD} < database/Create.sql
mysql -h ${D_DB_END} -P 3306 -u ${D_DB_USERNAME} -p${DB_PASSWORD} < database/Create.sql
sudo docker-compose up -d --build
docker exec backend bash -c "pytest tests/ --cov application"
docker exec frontend bash -c "pytest tests/ --cov application"
sudo docker-compose down
