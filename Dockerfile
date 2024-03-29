FROM node as build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

FROM alpine

RUN apk --no-cache add thttpd perl

COPY --from=build /app/dist /var/www/http
COPY ./scripts/entrypoint.sh /entrypoint.sh

EXPOSE 80

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh","/var/www/http","/usr/sbin/thttpd","-D","-l","/dev/stderr","-d","/var/www/http"]
