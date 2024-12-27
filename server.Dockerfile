FROM node:lts AS builder
ARG VERSION 0.0.3
LABEL maintainer="Scott Roberts, Convesio"

WORKDIR /app/medusa
COPY ./medusa-store .

RUN apt-get update && apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf node_modules && \
    npm install --global npm@11.0.0 && \
    npm install --loglevel=error && \
    npm run build
##### TODO: figure out how we build this and get a dist folder
FROM node:lts

WORKDIR /app/medusa

RUN mkdir dist

COPY ./medusa-store/package*.json ./
COPY ./backend-develop.sh ./develop.sh
COPY ./medusa-store/.env .
COPY ./medusa-store/medusa-config.ts .

RUN apt-get update && apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/* && \
    npm install --global npm@11.0.0 && \
    npm install --global @medusajs/medusa-cli@latest && \
    npm i --only=production

COPY --from=builder /app/medusa/dist ./dist

EXPOSE 9000

COPY run.sh /run.sh
CMD ["bash", "/run.sh"]
