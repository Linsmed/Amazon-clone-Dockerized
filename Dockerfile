FROM node:lts-buster-slim 
ARG NODE_ENV=productions
ENV NODE_ENV=${NODE_ENV}
ENV NODE_OPTIONS=--dns-result-order=ipv4first


WORKDIR /usr/src/app

COPY package.json .
COPY yarn.lock .

RUN yarn install 

COPY . . 

CMD ["yarn", "start"]
