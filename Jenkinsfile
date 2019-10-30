pipeline {
  agent {
    docker {
      image 'node:latest'
      args '-p 8009:3000'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'npm --version'
      }
    }
  }
}