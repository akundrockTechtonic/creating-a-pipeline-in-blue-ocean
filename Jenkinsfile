pipeline {
  agent {
    docker {
      args '-p 3000:3000'
      image 'node:current-alpine'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }
  }
}