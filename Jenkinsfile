pipeline{
        agent any
        stages{
            stage('Testing'){
                steps{
                    sh 'rm -r CNE-SIFA2/'
                    sh 'git clone "https://github.com/Cpt-Falconator/CNE-SIFA2.git"'
                    sh 'cd CNE-SIFA2/'
                    sh 'mysql -h testing-db.c3up5hij9k9x.eu-west-1.rds.amazonaws.com -P 3306 -u FalconTest -pMWAMDATABASE < database/Create.sql'
                    sh '-E DATABASE_URI=${DATABASE_URI} -E TEST_DATABASE_URI=${TEST_DATABASE_URI} -E SECRET_KEY=${SECRET_KEY} docker-compose up -d --build'
                    sh 'docker exec backend bash -c "pytest tests/ --cov application"'
                    sh 'docker exec frontend bash -c "pytest tests/ --cov application"'
                    sh 'docker-compose down'
                    sh 'rm -r CNE-SIFA2/'
                }
            }
        }
}
