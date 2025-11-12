# docker-strapi

A minimal Docker setup for **Strapi v5** with Node 20 and SQLite.

## Build & Run

```bash
docker build -t my-strapi:5.31 .
docker run -p 1337:1337 my-strapi:5.31
