pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository from the 'main' branch
                git branch: 'main', url: 'https://github.com/Firas-Ruine/todo-devops.git'
            }
        }
        
        stage('Build') {
            // Build the Docker image with the tag as the build number of the Jenkins job
            steps {
               docker.build("firasruine007/todo-devops:${env.BUILD_NUMBER}")
            }
        }
        
        stage('Push') {
            // Push the Docker image to the Docker Hub repository with the tag as the build number of the Jenkins job
            steps {
                docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                    docker.image("firasruine007/todo-devops:${env.BUILD_NUMBER}").push()
                }
            }
        }

        stage('Deploy') {
            // Deploy the application to the Kubernetes cluster using the Kubernetes manifests in the 'k8s' directory
            steps {
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
            }
        }
        
}
}