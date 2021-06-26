pipeline {
  agent any
  environment {
    def TIMESTAMP = sh(script: "echo `date +%Y%m%d%H%M%S`", returnStdout: true).trim()
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker-compose build ng-pokedex-build'
      }
      post{
        success {
          if (env.BRANCH_NAME.startsWith("dev")) {
            sh 'git merge -X env.BRANCH_NAME master'
          }
          else
          {
            echo "Skipping merging..."
          }
        }
      }
    }
    stage('Lint') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'docker-compose build ng-pokedex-test'
          sh 'docker-compose run -e BRANCH=' + env.BRANCH_NAME + ' -e TIMESTAMP=$TIMESTAMP ng-pokedex-lint'
        }
      }
    }
    stage('UnitTests') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'docker-compose run -e BRANCH=' + env.BRANCH_NAME + ' -e TIMESTAMP=$TIMESTAMP ng-pokedex-unittest'
        }
      }
    }
    stage('E2ETests') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'docker-compose run -e BRANCH=' + env.BRANCH_NAME + ' -e TIMESTAMP=$TIMESTAMP ng-pokedex-e2etest'
        }
      }
    }
    stage('Production') {
      steps {
        catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
          sh 'docker-compose build ng-pokedex-prod'
          sh 'docker-compose run -e BRANCH=' + env.BRANCH_NAME + ' -e TIMESTAMP=$TIMESTAMP ng-pokedex-prod'
        }
      }
    }
  }
}
