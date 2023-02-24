
pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }   
        
        stage('CI: Build Docker Image') {
            steps {
                script {
                                    
                              sh 'pwd'
                              sh 'docker build .  -t alimarawan2121/py-app'
                        
                              // docker.build(" --network=my-network -t py-app:${env.BUILD_NUMBER}")
                    
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {

                    withCredentials([usernamePassword(credentialsId: 'DockerHub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                    sh "docker push alimarawan2121/py-app"
                    
                }



//                     docker.withRegistry('https://hub.docker.com/', 'DockerHub') {
//                         dockerImage.push("${env.BUILD_NUMBER}")
//                     }
                }
            }
        }
        
        stage('CD on EKS') {
            steps {
                script {
                    sh """
                          kubectl apply -f /var/jenkins_home/workspace/Python-App-CI-CD/K8S/ConfigMap.yml -n app
                          kubectl apply -f /var/jenkins_home/workspace/Python-App-CI-CD/K8S/Redis-Deployment -n app
                         kubectl apply -f /var/jenkins_home/workspace/Python-App-CI-CD/K8S/Redis-svc.yml -n app
                          kubectl apply -f /var/jenkins_home/workspace/Python-App-CI-CD/K8S/Py-App-Dployment.yml -n app
                        kubectl apply -f /var/jenkins_home/workspace/Python-App-CI-CD/K8S/LB-Py-App.yml -n app """
                }
            }
        }
    }
}
