FROM node:latest

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install dependencies

COPY package.json .
RUN npm install
RUN npm install -g nodemon

# Bundle app source
COPY . .

# Exports
EXPOSE 5000
CMD [ "npm", "start" ]
