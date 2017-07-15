# Rails System Test Example

## Requirements

- docker
- docker-compose
- docker-sync

## Setup

    docker-sync start
    docker-compose run web bin/setup

## Run test

    docker-compose run web bin/rails test
