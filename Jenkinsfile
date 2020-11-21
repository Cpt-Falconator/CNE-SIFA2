pipeline{
        agent any
        environment{
                DOCKER_USER=credentials('DOCKER_USER')
                DOCKER_PASSWORD=credentials('DOCKER_PASSWORD')
        }
        stages{
            stage('Testing'){
                steps{
                        sh 'sudo bash ./scripts/test_scripts.sh'
                        }
                }
            stage('Pushing builds to docker'){
                steps{
                        sh 'sudo bash ./scripts/docker_push.sh'
                        }
                }
        }
}
