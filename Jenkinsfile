pipeline{
        agent any
        environment {
        }
        stages{
            stage('Testing'){
                steps{
                    sudo rm -r CNE_SIFA2
                    git clone https://github.com/Cpt-Falconator/CNE-SIFA2.git
                    cd CNE-SIFA2/
                    mysql -h terraform-20201121130634916500000002.c3up5hij9k9x.eu-west-1.rds.amazonaws.com -P 3306 -u FalconTest -pMWAMDATABASE < database/Create.sql
                    docker-compose up -d --build
                    docker exec backend bash -c "pytest tests/ --cov application" >> backend_test.txt
                    docker exec frontend bash -c "pytest tests/ --cov application" >> frontend_test.txt
                    docker-compose down
                }
            }
        }
}
