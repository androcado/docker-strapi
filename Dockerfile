# Use a stable Node LTS image
FROM node:20

# Create app directory
WORKDIR /srv/app

# Install Strapi v5 (non-interactive)
RUN npx create-strapi-app@latest . --quickstart --no-run --no-git-init

# Build admin panel
RUN npm run build

# Clean up dev deps
RUN npm prune --omit=dev

# Expose port
EXPOSE 1337

# Run Strapi in production mode
CMD ["npm", "run", "start"]
