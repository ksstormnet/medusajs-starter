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

COPY --from=builder /app/medusa/.medusa/server/ ./dist

EXPOSE 9000

# ENTRYPOINT ["./develop.sh", "start"]
## this came from the template docker rep, but I don't think it's right.

COPY run.sh /run.sh
CMD ["bash", "/run.sh"]
# using this to keep the server container running for manual work inside it
