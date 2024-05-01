pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']],
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
                                            bat 'docker rm demo-container'
                                        }
                                   }
                        }
        stage('Build docker image'){
            steps{
                script{
                    docker.build("sezer/jenkins:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Push image to Hub'){
                    steps{
                        script{
                            docker.image("sezer/jenkins:${env.BUILD_NUMBER}").run("-d -p 4444:8080 --name demo-container")
                        }
                    }
                }

    }

}