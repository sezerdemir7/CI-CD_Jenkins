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

        stage('Build docker image'){
            steps{
                script{
                    docker.build("demo/app:${env.BUILD_NUMBER}")
                }
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

        stage('Run Docker Container') {
                    steps {
                        script {
                            docker.image("demo/app:${env.BUILD_NUMBER}").run("-d -p 4444:8080 --name demo-container")
                        }
                    }
                }

    }

}