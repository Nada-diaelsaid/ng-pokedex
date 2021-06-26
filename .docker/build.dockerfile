FROM node:14.15.5

RUN apt-get update && apt-get install -y

COPY . /pokedex
WORKDIR /pokedex

# install angular-cli and dependencies
RUN npm install
RUN npm link @angular/cli

# Build angular app
RUN ng build
