## Description

A coffee API which uses NestJS, PostgreSQL and Docker. In the section_2 branch, MongoDB is used with Mongoose, instead of PostgreSQL.

## Installation

```bash
$ npm install
```

## Commands for Running the app

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov

```

## How to Run the API

```
Firstly, create a .env file with the following variables:

DATABASE_USER=postgres
DATABASE_PASSWORD=<a password>
DATABASE_NAME=postgres
DATABASE_PORT=5432
DATABASE_HOST=localhost
API_KEY=<a random string of characters>

$ docker-compose up
$ npm run start:dev

After running locally, requests can be made to http://localhost:3000

Please note that requests must contain the header with your Authorization Key and API_KEY Value which you have declared in .env

To view all endpoints, please visit http://localhost:3000/api

Follow the below instructions to restore data from a PostgreSQL backup if test data is needed.
```

![View][./images/swagger-api.png]

## How to Backup PostgreSQL Data

[Link](https://dev.to/siraphobk/how-to-persist-and-backup-postgresql-docker-container-b75)

```
// Generally:
$ docker exec -t <your-postgres-container-id> pg_dumpall -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M\_%S`.sql

// In this application:
$ docker exec -t <your-postgres-container-id> pg_dumpall -c -U postgres > postgres-backups/dump_`date +%d-%m-%Y"_"%H_%M\_%S`.sql

```

## How to Restore Data from a PostgreSQL Backup

```
// Generally:
$ cat your_dump.sql | docker exec -i <your-postgres-container-id> psql -U myuser

// In this application:
$ cat postgres-backups/your_dump.sql | docker exec -i <your-postgres-container-id> psql -U postgres

```

## Other Useful Docker Commands

```
$ docker volume prune // delete all volumes
$ docker container prune // delete all containers
$ docker volume ls // view all volumes
$ docker container ls // view all containers
$ docker-compose up
$ docker-compose down
```

## Support

Nest is an MIT-licensed open source project. It can grow thanks to the sponsors and support by the amazing backers. If you'd like to join them, please [read more here](https://docs.nestjs.com/support).

## License

Nest is [MIT licensed](LICENSE).
