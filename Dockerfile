# Use offical Node.js image.  The image uses Alpine linux
FROM node:8.2.1-alpine

# Install forever (https://www.npmjs.com/package/forever) to manage running server.js in container.
RUN npm install -g forever

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

# Start server.js using forever
CMD [ "forever", "start", "server.js" ]