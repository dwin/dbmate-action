# dbmate-action

This repository contains a GitHub Action for running [Dbmate](https://github.com/amacneil/dbmate), used
for database migrations.

It is based on the [Official Docker Hub Image](https://hub.docker.com/r/amacneil/dbmate),
which is based on Alpine Linux.

## Inputs

### `command`

The command to run. Default `"--help"`, but you'll likely want to use `"up"`.

See [Dbmate documentation](https://github.com/amacneil/dbmate#commands) for commands.

## Example usage

See [https://github.com/amacneil/dbmate#command-line-options](https://github.com/amacneil/dbmate#command-line-options)
for more configuration options to be passed by environment variables.

### Basic Usage

Uses the default command `up` and does not check in the database schema.

```yaml
...
steps:
  - name: "Run migrations"
    uses: actions/dbmate-action@v1.15
    with:
      command: 'up'
    env:
      DATABASE_URL: ${{ secrets.DATABASE_URL }}
      DBMATE_MIGRATIONS_DIR: "./migrations"
      DBMATE_NO_DUMP_SCHEMA: "true"
      DBMATE_WAIT: "true"
      DBMATE_WAIT_TIMEOUT: "30s"
...
```

### Check in the database schema

```yaml
...
steps:
  - name: "Run migrations"
    uses: actions/dbmate-action@v1.15
    with:
      command: 'up'
    env:
      DATABASE_URL: ${{ secrets.DATABASE_URL }}
      DBMATE_MIGRATIONS_DIR: "./migrations"
      DBMATE_SCHEMA_FILE: "./schema.sql"
      DBMATE_WAIT: "true"
      DBMATE_WAIT_TIMEOUT: "30s"
  - name: "Add & Commit latest schema"
    uses: EndBug/add-and-commit@v9
    with:
      default_author: github_actions
...
```
