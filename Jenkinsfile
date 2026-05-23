pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git 'https://github.com/billa30727/Trendstore-DevOps-Project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t trendstore-app .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "30727" --password-stdin
                    '''
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker tag trendstore-app 30727/trendstore-app:latest'
                sh 'docker push 30727/trendstore-app:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
