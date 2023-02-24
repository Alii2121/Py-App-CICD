pipeline {
    agent {
        docker {
            image 'jenkins/inbound-agent'
            label 'my-custom-label'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker pull my-base-image'
                sh 'docker build -t my-image:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'docker push my-image:latest'
            }
        }
    }
}



// pipeline {
//     agent any
    
//     stages {
//         stage('Checkout') {
//             steps {
//                 checkout scm
//             }
//         }   
        
//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     docker.build("py-app:${env.BUILD_NUMBER}", "/var/jenkins_home/workspace/Py-App-CICD/Dockerfile")
//                 }
//             }
//         }
        
//         stage('Push Docker Image') {
//             steps {
//                 script {
//                     docker.withRegistry('https://hub.docker.com/repositories/alimarawan2121', 'DockerHub') {
//                         dockerImage.push("${env.BUILD_NUMBER}")
//                     }
//                 }
//             }
//         }
        
//         // stage('Deploy to Kubernetes') {
//         //     steps {
//         //         script {
//         //             sh "kubectl apply -f deployment.yaml"
//         //         }
//         //     }
//         // }
//     }
// }
