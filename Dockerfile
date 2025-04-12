FROM node:lts-buster-slim

# Set build argument and environment variable
ARG NODE_ENV=production
ENV NODE_ENV=$NODE_ENV

# Set working directory
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json initially
COPY package.json .
COPY package-lock.json .

# Install dependencies using npm
RUN apt-get update && apt-get --assume-yes install ca-certificates \
  && npm install --only=production \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Copy the rest of the application code
COPY . .

# Set the default command
CMD ["npm", "start"]
