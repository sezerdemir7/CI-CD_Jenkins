pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // GitHub'dan projeyi al
                git 'https://github.com/sezerdemir7/DemoProject.git'
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
                    docker.image("demo-app:${env.BUILD_NUMBER}").run("-p 8989:8989 --name demo-container")
                }
            }
        }
    }



   post {
           always {
               // Docker konteynerini durdur ve temizle
               script {
                   def container = docker.container("demo-container")
                   if(container) {
                       container.stop()
                       container.remove(force: true)
                   }
               }
           }
       }

       }