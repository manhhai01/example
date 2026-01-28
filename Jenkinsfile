pipeline {
    agent any

    environment {
        // ĐỔI lại cho đúng với repo Docker Hub của bạn, ví dụ: myuser/hello-world
        IMAGE_NAME = 'manhhai/example'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/manhhai01/example'
            }
        }

        stage('Build JAR') {
            steps {
                bat "mvn -B clean package"
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %IMAGE_NAME%:latest ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat """
                        echo %DOCKER_PASS% |
                        docker login -u %DOCKER_USER% --password-stdin
                        docker push %IMAGE_NAME%:latest
                        docker logout
                    """
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}

