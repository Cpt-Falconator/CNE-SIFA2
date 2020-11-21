pipeline{
        agent any
        environment {
                DATABASE_URI = credentials('DATABASE_URI')
                SECRET_KEY   = credentials('SECRET_KEY')
                TEST_DATABASE_URI = credentials('TEST_DATABASE_URI')
                T_DB_USERNAME = credentials('T_DB_USERNAME')
                T_DB_PASSWORD = credentials('T_DB_PASSWORD')
                T_DB_END = credentials('T_DB_END')
                D_DB_USERNAME = credentials('D_DB_USERNAME')
                D_DB_PASSWORD = credentials('D_DB_PASSWORD')
                D_DB_END = credentials('D_DB_END')
        }   
        stages{
            stage('Testing'){
                steps{
                    sh 'sudo bash ./scripts/test_scripts.sh'
                }
            }
        }
}
