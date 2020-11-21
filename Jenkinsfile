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
                        sh 'sudo bash ./scripts/docker_push.sh'
                        }
                }
        }
}
