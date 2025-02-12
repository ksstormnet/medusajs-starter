FROM node:lts AS builder
ARG VERSION 0.0.3
LABEL maintainer="Scott Roberts, Convesio"

WORKDIR /app/admin

ENV NODE_OPTIONS=--openssl-legacy-provider

COPY . .

RUN rm -rf node_modules && \
    apt-get update && apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/* && \
    yarn add sharp && \
    yarn global add gatsby-cli && \
    yarn install && \
    gatsby build


    FROM nginx

EXPOSE 80

COPY --from=builder /app/admin/public /usr/share/nginx/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
