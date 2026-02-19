FROM node:lts-alpine3.22 AS build
WORKDIR /app
COPY ../client ./
RUN set -eux && \
    npm i

FROM nginx:1.28.2-alpine3.23 AS front
WORKDIR /usr/share/nginx/html
