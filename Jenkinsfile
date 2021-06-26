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
          script {
            if (env.BRANCH_NAME.startsWith("dev")) {
              sh 'git fetch --all'
              sh 'git checkout master'
              sh 'git checkout ' + env.BRANCH_NAME
              sh 'git merge master'
            }
            else
            {
              sh 'echo "Skipping merging..."'
            }
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
