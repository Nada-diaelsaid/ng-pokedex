FROM ng-pokedex-client

WORKDIR /pokedex

# run unit tests
RUN ng test

# run end-to-end tests
RUN ng e2e
