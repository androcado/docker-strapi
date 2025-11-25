FROM node:22-alpine

WORKDIR /app

ENV NODE_ENV=development
ENV CI=true
ENV STRAPI_DISABLE_WELCOME_MESSAGE=true
ENV STRAPI_TELEMETRY_DISABLED=true

# Install npm latest (Strapi requires it)
RUN npm install -g npm@latest

# Install Strapi project non-interactively
RUN npm create strapi@latest . -- --quickstart --no-run --skip || true

# Install MySQL connector
RUN npm install mysql2

EXPOSE 1337

CMD ["npm", "run", "develop"]
