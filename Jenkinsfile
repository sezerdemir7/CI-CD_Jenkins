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
                try {
                    bat 'docker stop demo-container'
                    bat 'docker rm demo-container'
                    bat 'docker rmi demo-app:${env.BUILD_NUMBER}'
                } catch (Exception e) {
                    echo "Hata oluştu: ${e.message}"
                    currentBuild.result = 'FAILURE'
                }
            }
        }
    }
}
