# base image
FROM node:10.15.1-alpine

# set working directory
RUN mkdir /app
WORKDIR /app

# install and cache app dependencies
COPY ["package.json", "package-lock.json", "cacert.pem", "./"]
RUN npm config set cafile cacert.pem && npm install

# start app
CMD ["npm", "start"]