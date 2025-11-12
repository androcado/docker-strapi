FROM node:20

WORKDIR /srv/app

# Disable the Strapi interactive login prompt
ENV STRAPI_DISABLE_REMOTE_PUBLICATIONS=true

# Headless installation (v5)
RUN npx create-strapi-app@latest . --no-run --no-git-init --use-npm --dbclient=sqlite --dbfile=./data.db

# Build admin panel
RUN npm run build

EXPOSE 1337
CMD ["npm", "run", "start"]
