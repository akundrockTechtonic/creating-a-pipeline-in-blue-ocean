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
    stage('Test') {
      environment {
        CI = 'true'
      }
      steps {
        sh './jenkins/scripts/test.sh'
      }
    }
    stage('Deliver') {
      steps {
        sh './jenkins/scripts/deliver.sh'
        input 'Click proceed to continue'
        sh './jenkins/scripts/kill.sh'
      }
    }
  }
}