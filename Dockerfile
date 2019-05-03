FROM nginx:stable-alpine
EXPOSE 80
RUN apk add --no-cache curl
RUN curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/v0.0.8/ep-linux && chmod +x /usr/local/bin/ep
COPY src /usr/share/nginx/html
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh
RUN chmod -R 755 /usr/share/nginx/html
CMD ["/bin/sh", "/usr/local/bin/docker-entrypoint.sh" ]