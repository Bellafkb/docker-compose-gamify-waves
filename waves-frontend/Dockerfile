# develop stage
FROM node:11.1-alpine

WORKDIR /app

COPY package*.json ./ 

RUN npm config set unsafe-perm true

RUN npm install -g serve

RUN npm install

COPY . .

RUN npm run build

CMD [ "serve", "-p", "8080", "-s", "dist" ]