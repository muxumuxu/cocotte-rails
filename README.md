# README

The cocotte back-end project written in RubyOnRails.

## Setup

You must install [Docker](https://www.docker.com/)

Next, generates docker images with `docker-compose build`.

Create the database and run migrations :

`docker-compose run web rails db:create db:migrate`

Run the initial import that fetch data from our competitor :

`docker-compose run web rails initial_import:import`


### Guard

When you are developing a new feature or fixing something it's recomanded that you launch [guard](https://github.com/guard/guard).

`./scripts/guard`

## Danger Enum

- _:empty_, "Aucun interdit"
- _:care_, "A éviter"
- _:avoid_, "Faire attention"
