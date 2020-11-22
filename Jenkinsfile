pipeline{
        agent any
        environment{
            DOCKER_USER=credentials('DOCKER_USER')
            DOCKER_PASSWORD=credentials('DOCKER_PASSWORD')
            DATABASE_URI=credentials('DATABASE_URI')
            SECRET_KEY=credentials('SECRET_KEY')
            TEST_DATABASE_URI=credentials('TEST_DATABASE_URI')
        }
        stages{
            stage('Testing'){
                steps{
                        sh 'sudo bash ./scripts/test_scripts.sh'
                        }
                }
            stage('Pushing builds to docker.io'){
                steps{
                        sh 'sudo docker login --username=${DOCKER_USER} --password=${DOCKER_PASSWORD}'
                        sh 'sudo bash ./scripts/docker_push.sh'
                        }
                }
            stage('deploy') {
                steps {
                        sh 'sudo bash ./scripts/k8_deploy.sh'
                        }
                }
        }
}
