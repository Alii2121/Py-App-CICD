
pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }   
        
        stage('Build Docker Image') {
            steps {
                script {
                                    

                              sh 'docker build .  -t alimarawan2121/py-ap'
                        
                              // docker.build(" --network=my-network -t py-app:${env.BUILD_NUMBER}")
                    
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/', 'DockerHub') {
                        dockerImage.push("${env.BUILD_NUMBER}")
                    }
                }
            }
        }
        
        // stage('Deploy to Kubernetes') {
        //     steps {
        //         script {
        //             sh "kubectl apply -f deployment.yaml"
        //         }
        //     }
        // }
    }
}
