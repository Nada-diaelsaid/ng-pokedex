FROM ng-pokedex-build:latest

COPY scripts/run.sh /pokedex/scripts/run.sh 

# install zip
RUN apt-get install -y zip

# Clean build
RUN rm -rf dist

# Run production build
RUN ng build --configuration production