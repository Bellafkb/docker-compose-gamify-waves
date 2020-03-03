FROM node:latest

WORKDIR /usr/app

COPY package.json .
RUN npm i -g nodemon
RUN npm install

COPY . .