FROM ng-pokedex-build:latest

COPY create_artifact.sh /pokedex/create_artifact.sh 

# install zip
RUN apt-get install -y zip

# Clean build
RUN rm -rf dist

# Run production build
RUN ng build --configuration production