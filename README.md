# README

The cocotte back-end project written in RubyOnRails.

## Setup

```
docker-compose build
docker-compose run web rails db:create db:migrate
docker-compose run web rails initial_import:import
```

## Danger Enum

- _:empty_, "Aucun interdit"
- _:care_, "A éviter"
- _:avoid_, "Faire attention"
