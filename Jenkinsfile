pipeline {
    agent any
    tools {
            maven 'maven'
        }
         environment {
                JAVA_HOME = 'C:\Program Files\Java\jdk-19\bin'
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


        stage('Checkout') {
            steps {
                // GitHub'dan projeyi al
                git 'https://github.com/sezerdemir7/DemoProject.git'
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

        stage('Build Docker Image') {
            steps {
                // Docker imajını oluştur
                script {
                    docker.build("demo-app:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Docker imajını çalıştır
                script {
                    docker.image("demo-app:${env.BUILD_NUMBER}").run("-p 8989:8080 --name demo-container")
                }
            }
        }
    }

    post {
        always {
            // Docker konteynerini durdur ve temizle
            script {
                try {
                    // Docker konteynerini durdurma işlemi
                   // bat 'docker stop demo-container'
                    // Docker konteynerini temizleme işlemi
                  //  bat 'docker rm demo-container'
                    //bat "docker rmi demo-app:${env.BUILD_NUMBER}"
                } catch (Exception e) {
                    // Hata durumunda Jenkins işlemi başarısız olsun
                    echo "Hata oluştu: ${e.message}"
                    currentBuild.result = 'FAILURE'
                }
            }
        }
    }
}