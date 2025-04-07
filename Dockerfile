FROM node:lts-buster-slim

# Set environment
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

# Set working directory
WORKDIR /usr/src/app

# Copy dependency files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the app
COPY . .

# Start the app
CMD ["npm", "start"]
