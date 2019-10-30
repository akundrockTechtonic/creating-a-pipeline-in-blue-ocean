pipeline {
  agent {
    docker {
      args '-p 3001:3000'
      image 'node'
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