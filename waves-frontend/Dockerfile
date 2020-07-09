# develop stage
FROM node:11.1-alpine

WORKDIR /app

COPY package*.json ./ 

RUN npm install && npm install -g serve

COPY . .

# build stage
#FROM develop-stage as build-stage
#RUN npm build