pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker-compose build ng-pokedex-build'
      }
    }
    stage('Lint') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'docker-compose build ng-pokedex-test'
          sh 'docker-compose run ng-pokedex-lint'
        }
      }
    }
    stage('UnitTests') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'docker-compose run ng-pokedex-unittest'
        }
      }
    }
    stage('E2ETests') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'docker-compose run ng-pokedex-e2etest'
        }
      }
    }
    stage('Production') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'docker-compose build ng-pokedex-prod'
          sh 'docker-compose run -e BRANCH=' + env.BRANCH_NAME + ' ng-pokedex-prod'
        }
      }
    }
  }
}
