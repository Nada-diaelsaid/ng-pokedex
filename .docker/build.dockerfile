FROM node:14.15.5

# install angular-cli
RUN apt-get update && apt-get install -y

# Build angular app
COPY . /pokedex
WORKDIR /pokedex

RUN npm install
RUN npm link @angular/cli

# or RUN cd /pokedex
RUN ng build
