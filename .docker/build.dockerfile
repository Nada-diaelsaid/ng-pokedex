FROM node:14.15.5

ARG NG_CLI_VERSION=latest

# install angular-cli
RUN apt-get update && apt-get install -y
RUN yarn global add @angular/cli@$NG_CLI_VERSION -T && rm -rf $(yarn cache dir)
RUN npm install @angular-devkit/build-angular

# Build angular app
COPY . /pokedex
WORKDIR /pokedex
# or RUN cd /pokedex
RUN ng build

