pipeline{
        agent any
        stages{
            stage('Testing'){
                steps{
                    sh 'rm -r CNE-SIFA2/'
                    sh 'git clone "https://github.com/Cpt-Falconator/CNE-SIFA2.git"'
                    sh 'cd CNE-SIFA2/'
                    sh 'mysql -h testing-db.c3up5hij9k9x.eu-west-1.rds.amazonaws.com -P 3306 -u FalconTest -pMWAMDATABASE < database/Create.sql'
                    sh 'echo ${DATABASE_URI}'
                    sh 'docker-compose up -d --build'
                    sh 'sudo docker exec backend bash -c "pytest tests/ --cov application"'
                    sh 'sudo docker exec frontend bash -c "pytest tests/ --cov application"'
                    sh 'docker-compose down'
                    sh 'rm -r CNE-SIFA2/'
                }
            }
        }
}
