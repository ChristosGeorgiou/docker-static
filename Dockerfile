FROM node as build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

FROM alpine

RUN apk --no-cache add thttpd

COPY scripts/set-env.sh /set-env.sh
COPY --from=build /app/dist /var/www/http

EXPOSE 80

ENTRYPOINT ["./set-env.sh","/var/www/http"]

CMD ["/usr/sbin/thttpd", "-D",  "-l", "/dev/stderr", "-d", "/var/www/http"]
