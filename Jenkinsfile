pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[url: 'https://github.com/sezerdemir7/DemoProject.git']]
                )
                bat 'mvn clean install'
            }
        }
        stage('Stop and Remove Existing Container') {
                             steps {
                                 script {
                                   // Varolan container'ı durdur ve sil
                                            bat 'docker stop demo-container '
                                            bat 'docker rm demob -container'
                                        }
                                   }
                        }
        stage('Build docker image'){
            steps{
                script{
                    docker.build("demo-container:${env.BUILD_NUMBER}")
                }
            }
        }


    }

}



















