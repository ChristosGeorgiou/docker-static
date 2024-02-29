FROM node as build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

FROM alpine

RUN apk --no-cache add thttpd

WORKDIR /var/www/http

COPY --from=build /app/dist .

EXPOSE 80

ENTRYPOINT ["/usr/sbin/thttpd"]

CMD ["-D",  "-l", "/dev/stderr", "-d", "/var/www/http"]
