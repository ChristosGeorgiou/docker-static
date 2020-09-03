FROM node:alpine

COPY . /app
WORKDIR /app

ENV NODE_ENV production

RUN npm install

EXPOSE 3000

CMD [ "npm", "start" ]