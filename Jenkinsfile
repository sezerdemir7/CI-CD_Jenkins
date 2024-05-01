pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/sezerdemir7/DemoProject.git'
            }
        }

        stage('Stop and Remove Existing Container') {
            steps {
                script {
                    // Varolan container'ı durdur ve sil
                    sh 'docker stop demo-container || true'
                    sh 'docker rm demo-container || true'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("demo-app:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image("demo-app:${env.BUILD_NUMBER}").run("-p 8989:8080 --name demo-container")
                }
            }
        }
    }

    post {
        always {
            script {
                try {
                    // Docker konteynerini durdur ve temizle
                   // sh 'docker stop demo-container || true'
                   // sh 'docker rm demo-container || true'
                    //sh "docker rmi demo-app:${env.BUILD_NUMBER} || true"
                } catch (Exception e) {
                    echo "Hata oluştu: ${e.message}"
                    currentBuild.result = 'FAILURE'
                }
            }
        }
    }
}
