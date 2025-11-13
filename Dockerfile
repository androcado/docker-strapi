FROM node:20

WORKDIR /srv/app

# Disable all interactive prompts and cloud onboarding
ENV STRAPI_TELEMETRY_DISABLED=true
ENV STRAPI_HIDE_STARTUP_MESSAGE=true
ENV STRAPI_DISABLE_REMOTE_PUBLICATIONS=true
ENV STRAPI_SKIP_CLOUD=true

# Generate Strapi project non-interactively
RUN npx create-strapi-app@latest . \
  --no-run \
  --no-git-init \
  --use-npm \
  --dbclient=sqlite \
  --dbfile=./data.db \
  --skip-cloud

# Install dependencies
RUN npm install

# Build admin UI
RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]
