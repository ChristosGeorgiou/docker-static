FROM node:12-alpine as builder

ENV NODE_ENV production

COPY . /app
WORKDIR /app

RUN npm install

ENV TITLE ${TITLE:-none}
ENV SUBTITLE ${SUBTITLE:-none}
ENV DESCRIPTION ${DESCRIPTION:-none}
ENV AUTHOR ${AUTHOR:-none}

RUN npm run build

FROM nginx:stable-alpine
RUN apk add --no-cache curl
RUN curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/v0.0.8/ep-linux && chmod +x /usr/local/bin/ep
COPY --from=builder /app/dist /usr/share/nginx/html
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh
RUN chmod -R 755 /usr/share/nginx/html
CMD ["/bin/sh", "/usr/local/bin/docker-entrypoint.sh" ]