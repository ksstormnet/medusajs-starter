FROM node:lts

# Update package lists and install PostgreSQL
RUN apt-get update && apt-get install -y \
    postgresql \
    postgresql-contrib \
    redis-server redis-tools \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables for PostgreSQL
ENV DATABASE_URL=postgres://medusajs:medusajs@localhost:5432/medusadb

# Create working directory
WORKDIR /app

# Start postgres and create the user and database
RUN service postgresql start && \
    su - postgres -c "psql -c \"CREATE USER medusajs WITH PASSWORD 'medusajs';\"" && \
    su - postgres -c "psql -c \"ALTER USER medusajs WITH SUPERUSER;\"" && \
# Install Medusa dependencies
    npm install -g npm@11.1.0 @medusajs/medusa-cli create-medusa-app next@latest && \
# Start redis
    service redis-server start

# Copy store and store-storefront
COPY store/ /app/store/
COPY store-storefront/ /app/store-storefront/
COPY ./run.sh /run.sh

# Return to app root
WORKDIR /app

# Expose ports
EXPOSE 9000
EXPOSE 5432
EXPOSE 6379

# Start script (you may want to customize this)
CMD ["bash", "/run.sh"]
