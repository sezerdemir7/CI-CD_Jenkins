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
                // Docker imajını oluştur (Optional: consider separate build server)
                script {
                    sh 'docker.build("demo-app:${env.BUILD_NUMBER}")'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Docker imajını çalıştır
                script {
                    sh 'docker.image("demo-app:${env.BUILD_NUMBER}").run("-p 8989:8989 --name demo-container")'
                }
            }
        }
    }

    post {
        always {
            // Docker konteynerini durdur ve temizle
            script {
                sh 'docker.image("demo-app:${env.BUILD_NUMBER}").stop()'
                sh 'docker.image("demo-app:${env.BUILD_NUMBER}").remove()'
            }
        }
    }
}