FROM node:latest as build-stage

WORKDIR /app

COPY package*.json ./

RUN npm --max_old_space_size=4096 install

COPY ./ .

RUN NODE_OPTIONS=--max_old_space_size=4096 npm run build

FROM nginx:latest as production-stage

RUN mkdir /app

COPY --from=build-stage /app/dist /app

COPY nginx.conf /etc/nginx/nginx.conf