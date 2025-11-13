FROM node:20

WORKDIR /srv/app

COPY strapi/package*.json ./
RUN npm install

COPY strapi ./

RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]
