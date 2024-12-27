FROM node:lts AS builder
ARG VERSION 0.0.3

WORKDIR /app/storefront

# Copy the application code
COPY ./medusa-store-storefront/ .

# Install corepack and dependencies, then build the project
RUN apt-get update && apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf node_modules && \
    corepack enable && \
    corepack prepare yarn@3.2.3 --activate && \
    npm install --global npm@11.0.0 && \
    npm install --global @medusajs/medusa-cli@latest && \
    yarn install && \
    yarn add sharp && \
    yarn build && \
    rm -rf /root/.npm /root/.cache /node_modules

FROM nginx:alpine

RUN apk add --no-cache bash 
WORKDIR /app/storefront

# Copy built files to Nginx
COPY --from=builder /app/storefront/public /usr/share/nginx/html

EXPOSE 80

COPY run.sh /run.sh
CMD ["/bin/bash", "/run.sh"]

