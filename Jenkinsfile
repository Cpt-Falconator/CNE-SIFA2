pipeline{
        agent any
        stages{
            stage('Testing'){
                steps{
                        sh 'sudo bash ./scripts/test_scripts.sh'
                }
            }
            stage('Pushing builds to docker'){
                steps{
                        sh 'docker login --username=${DOCKER_USER} --password=${DOCKER_PASSWORD}'
                        sh 'docker push cptfalconator/front_end:latest'
                        sh 'docker push cptfalconator/back_end:latest'
                }
        }
}
