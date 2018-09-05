FROM node:8-alpine
COPY src ./www
WORKDIR ./www
RUN npm i
ENTRYPOINT [ "node", "." ]