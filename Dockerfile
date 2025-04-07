FROM node:lts-buster-slim

ARG NODE_ENV=production
ENV NODE_ENV=$NODE_ENV

# Install yarn globally
RUN npm install -g yarn@1.22.19

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

CMD ["yarn", "start"]
