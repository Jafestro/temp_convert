pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS_ID = 'jafestro'
        DOCKERHUB_REPO = 'jafestro/temp_convert'
        DOCKER_IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    git 'https://github.com/Jafestro/temp_convert.git'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def customImage = docker.build("${DOCKERHUB_REPO}:${DOCKER_IMAGE_TAG}")
                }
            }
        }
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS_ID) {
                        docker.image("${DOCKERHUB_REPO}:${DOCKER_IMAGE_TAG}").push()
                    }
                }
            }
        }
    }
}
