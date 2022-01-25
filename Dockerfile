# specify the node base image with your desired version node:<version>
FROM node:16.13.1


RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package.json  /usr/src/app/

RUN npm install

COPY . /usr/src/app


# replace this wth your application's default port
EXPOSE 3000

CMD ["npm", "start"]
