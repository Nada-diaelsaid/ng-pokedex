# NgPokedex

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 12.0.2.

## Development server

Run ng serve for a dev server. Navigate to http://localhost:4200/. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run ng generate component component-name to generate a new component. You can also use ng generate directive|pipe|service|class|guard|interface|enum|module.

## Build

Run ng build to build the project. The build artifacts will be stored in the dist/ directory.

## Running unit tests

Run ng test to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run ng e2e to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Further help

To get more help on the Angular CLI use ng help or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.

<!-- BY NADA -->
# Prerequisites:
- First change to development branch: git checkout dev
- Install Jenkins on your local machine, create MultiBranch pipline project on Jenkins, add the git repo https://github.com/Nada-diaelsaid/ng-pokedex.git under Branch resources -> Github.
Build configuration -> by Jenkinsfile.
Scan Repository Triggers -> check box Periodically if not otherwise run -> Interval 1 minute.

- Install docker & docker-compose on your local machine

# Flow Using Docker #
sudo docker-compose build ng-pokedex-build # build project

sudo docker-compose up ng-pokedex-build # run the build (ng serve)

sudo docker-compose build ng-pokedex-test # build tests

sudo docker-compose run ng-pokedex-lint # run both unit tests and E2E

sudo docker-compose run ng-pokedex-unittest # run unittests

sudo docker-compose run ng-pokedex-e2etest # run E2E

sudo docker-compose build ng-pokedex-prod # Build production

sudo docker-compose run ng-pokedex-prod # Run build production