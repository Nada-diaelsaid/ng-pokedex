pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker-compose build ng-pokedex-client'
      }
    }
    stage('Lint') {
      steps {
        sh 'docker-compose build ng-pokedex-test'
        sh 'docker-compose run ng-pokedex-lint'
      }
    }
    stage('UnitTests') {
      steps {
        sh 'docker-compose run ng-pokedex-unittest'
      }
    }
    stage('E2ETests') {
      steps {
        sh 'docker-compose run ng-pokedex-e2etest'
      }
    }
  }
}
