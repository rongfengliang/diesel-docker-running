# rust diesel orm learning （with docker running）

## How to running

* install diesel_cli

```code
cargo install diesel_cli 
```

* create .env

```code
touch diesel_demo/.env
touch diesel_demo/.env-prod
```

* content for ` .env` file

```code
.env:
DATABASE_URL=postgres://postgres:dalong@localhost/diesel_demo
.env-prod:
DATABASE_URL=postgres://postgres:dalong@pg/diesel_demo

```

* do migration

```code
diesel setup
diesel migration run
```
* insert some datas

```code
INSERT INTO "public"."posts"("id","title","body","published")
VALUES
(1,E'dalong',E'demo',TRUE);
```

* build image

```code
docker-compose build
```

* start docker-compose service

```code
docker-compose up -d pg
docker-compose up app
```