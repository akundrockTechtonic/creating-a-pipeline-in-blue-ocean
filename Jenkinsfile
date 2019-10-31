pipeline {
  agent {
    docker {
      args '-p 3000:3000 -p 5000:5000'
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
    stage('Sonar Scan'){
      environment {
        scannerHome = tool 'SonarScanner 4.0'
      }
      steps {
        withSonarQubeEnv('Sonar OSX') {
          sh "${scannerHome}/bin/sonar-scanner"
        }
      }
      
    }
    stage('Deliver for development') {
      when {
        branch 'development'
      }
      steps {
        sh './jenkins/scripts/deliver-for-development.sh'
        input 'Click proceed to continue'
        sh './jenkins/scripts/kill.sh'
      }
    }
    stage("Deliver to production"){
      when {
        branch 'deployment'
      }
      steps {
        sh './jenkins/scripts/deploy-for-production.sh'
        input message: "Finished using the website?"
        sh './jenkins/scripts/kill.sh'
      }
    }
  }
}