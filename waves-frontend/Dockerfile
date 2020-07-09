# develop stage
FROM node:11.1-alpine

WORKDIR /app

COPY package*.json ./ 

RUN npm install -g serve
RUN npm install

COPY . .

RUN npm run build

CMD [ "serve", "-p", "8080", "-s", "dist" ]
# build stage
#FROM develop-stage as build-stage
#RUN npm build