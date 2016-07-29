# README

## Setup

```
be rails db:create
be rails db:migrate
be rails initial_import:import
be rails merge_categories:merge
be rails migrate_risks:migrate
```

## Danger Enum

- _:empty_, "Aucun interdit"
- _:care_, "A éviter"
- _:avoid_, "Faire attention"
