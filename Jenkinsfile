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
