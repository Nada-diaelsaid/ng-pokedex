pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker-compose build ng-pokedex-client'
      }
    }
  }
}
