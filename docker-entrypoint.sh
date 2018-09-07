#!/bin/sh
cp -v /usr/share/nginx/html/template.html /usr/share/nginx/html/index.html
ep -v /usr/share/nginx/html/index.html
nginx -g 'daemon off;'