pipeline{
        agent any
        environment{
                DATABASE_URI=credentials('DATABASE_URI')
                SECRET_KEY=credentials('SECRET_KEY')
                TEST_DATABASE_URI=credentials('TEST_DATABASE_URI')
                T_DB_USERNAME=credentials('T_DB_USERNAME')       
                T_DB_END=credentials('T_DB_END')
                D_DB_USERNAME=credentials('D_DB_USERNAME')
                D_DB_END=credentials('D_DB_END')
                DB_PASSWORD=credentials('DB_PASSWORD')
        }   
        stages{
            stage('Testing'){
                steps{
                    sh 'sudo bash ./scripts/test_scripts.sh'
                }
            }
        }
}
