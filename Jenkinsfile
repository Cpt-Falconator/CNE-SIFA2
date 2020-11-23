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
                        sh 'chmod +x ./scripts/test_scripts.s'
                        sh './scripts/test_scripts.sh'
                        }
                }
            stage('Pushing builds to docker.io'){
                steps{
                        sh 'sudo docker login --username=${DOCKER_USER} --password=${DOCKER_PASSWORD}'
                        sh 'chmod +x ./scripts/docker_push.sh'
                        sh './scripts/docker_push.sh'
                        }
                }
            stage('deploy') {
                steps {
                        sh 'chmod +x ./scripts/k8_deploy.sh'
                        sh './scripts/k8_deploy.sh'
                        }
                }
        }
}
