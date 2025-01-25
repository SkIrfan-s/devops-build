pipeline {
    agent any

    environment {
        DEV_DOCKER_IMAGE = 'afridi0313/dev'
        PROD_DOCKER_IMAGE = 'afridi0313/prod'
        DOCKER_REGISTRY = 'https://index.docker.io/v1/'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        // Build the Docker image for the dev branch
                        dockerImage = docker.build("${DEV_DOCKER_IMAGE}")
                    } else if (env.BRANCH_NAME == 'main') {
                        // Build the Docker image for the main branch
                        dockerImage = docker.build("${PROD_DOCKER_IMAGE}")
                    }
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'newdockerhub',
                                                     usernameVariable: 'DOCKER_USER',
                                                     passwordVariable: 'DOCKER_PASS')]) {
                        sh """
                        echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin $DOCKER_REGISTRY
                        """
                    }
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        // Push the Docker image to the dev repository
                        dockerImage.push("${env.BRANCH_NAME}-${env.BUILD_ID}")
                        dockerImage.push("latest")
                    } else if (env.BRANCH_NAME == 'main') {
                        // Push the Docker image to the private repository
                        dockerImage.push("${env.BRANCH_NAME}-${env.BUILD_ID}")
                        dockerImage.push("latest")
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean the workspace after the -build
            cleanWs()
        }
    }
}

