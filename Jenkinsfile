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
                    sh 'docker build -t demo-app:${env.BUILD_NUMBER} .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Docker imajını çalıştır
                script {
                    sh 'docker run -d -p 8989:8989 --name demo-container demo-app:${env.BUILD_NUMBER}'
                }
            }
        }
    }

    post {
        always {
            // Docker konteynerini durdur ve temizle
            script {
                sh 'docker stop demo-container || true'
                sh 'docker rm demo-container || true'
                sh 'docker rmi demo-app:${env.BUILD_NUMBER} || true'
            }
        }
    }
}
