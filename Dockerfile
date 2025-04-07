FROM node:lts-buster-slim

ARG NODE_ENV=production
ENV NODE_ENV=$NODE_ENV

# Force IPv4 to avoid network resolution issues in CI
ENV NODE_OPTIONS=--dns-result-order=ipv4first

# Install Yarn Classic (v1.22.19) globally
RUN npm install -g yarn@1.22.19

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

# Install dependencies with lockfile (good for CI)
RUN yarn install --frozen-lockfile

COPY . .

CMD ["yarn", "start"]
