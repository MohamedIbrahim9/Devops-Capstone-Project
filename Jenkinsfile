pipeline {
  agent any
  stages {
    stage("Lint HTML") {
      steps {
        sh 'tidy -q -e ./website/*.html'  
      }
    }
    
    stage("Build Docker image") {
      steps {
        sh 'docker build -t mohamed/node-web-app .'
      }
    }

    stage("Push Dcoker image") {
      steps {
        withDockerRegistry([url: "", credentialsId: "dockerhub_id"]) {
          sh 'docker login'  
          sh 'docker tag mohamed/node-web-app mohamedibrahim9/devops-capstone-app'  
          sh 'docker push mohamedibrahim9/devops-capstone-app'  
        }
      }
    }

    stage('Deploy Container') {
      steps {
        withAWS(region:'us-east-2',credentials:'user-aws') {
          sh 'aws eks update-kubeconfig --name devops-capstone-cluster'
          sh 'kubectl config use-context arn:aws:eks:us-east-2:653404899093:cluster/devops-capstone-app'
          sh 'kubectl apply -f deploy.yml'

        }
      }
    }

  }
}