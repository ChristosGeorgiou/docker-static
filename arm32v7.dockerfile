FROM arm32v7/node:12-alpine

ENV NODE_ENV production

COPY . /app
WORKDIR /app

RUN npm install

ENV TITLE="\${TITLE:-none}"
ENV SUBTITLE="\${SUBTITLE:-none}"
ENV DESCRIPTION="\${DESCRIPTION:-none}"
ENV AUTHOR="\${AUTHOR:-none}"

EXPOSE 3000

CMD [ "npm", "start" ]