FROM node:lts-buster-slim 
ARG NODE_ENV=productions
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package.json .
COPY yarn.lock .

RUN apt-get --assume-yes install yarn && apt-mark hold yarn 

COPY . . 

CMD ["yarn", "start"]
