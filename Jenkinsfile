pipeline{
        agent any
        environment{
                DATABASE_URI=credentials('DATABASE_URI')
                SECRET_KEY=credentials('SECRET_KEY')
                TEST_DATABASE_URI=credentials('TEST_DATABASE_URI')
        }
        stages{
            stage('Testing'){
                steps{
                    sh './scripts/test_scripts.sh'
                }
            }
        }
}
