
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
                     sh 'docker buildx create --name my-builder --driver-opt network=host'
                     sh 'docker buildx use my-builder'
                     sh 'docker buildx build --progress plain --load --platform linux/amd64 --network my-network -t alimarawan2121/py .'
                                    

//  sh 'docker build . --network=my-netwrok -t alimarawan2121/py-ap'
                        
                              // docker.build(" --network=my-network -t py-app:${env.BUILD_NUMBER}")
                    
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/repositories/alimarawan2121', 'DockerHub') {
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
