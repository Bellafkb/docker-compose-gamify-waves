# develop stage
FROM node:11.1-alpine

WORKDIR /app

COPY package*.json ./ 

RUN npm install -g serve
RUN npm install

COPY . .

# build stage
#FROM develop-stage as build-stage
#RUN npm build