<div align="center">
    <img src="https://convesio.com/favicon.ico" alt="Convesio Medusa Store" width="100" height="100">
    <h1>Convesio Medusa Store</h1>
    <p>A complete e-commerce solution powered by Medusa and Next.js</p>
</div>

## Overview

This project is a comprehensive e-commerce solution developed by [Convesio Inc.](https://convesio.com), built on top of the Medusa e-commerce framework and Next.js. It combines the robust backend capabilities of Medusa with a modern, performant frontend implementation.

### Based on Industry-Leading Solutions

This implementation is based on the following open-source projects:
- [Medusa](https://github.com/medusajs/medusa) - The core e-commerce engine
- [Docker Medusa](https://github.com/medusajs/docker-medusa) - Containerization setup
- [Next.js Starter Medusa](https://github.com/medusajs/nextjs-starter-medusa) - Frontend implementation

## Features

- 🛍️ Complete e-commerce functionality
- 🎨 Customizable storefront
- 📱 Responsive design
- 🔒 Secure payment processing
- 📦 Order management
- 🎯 Product management
- 👥 Customer accounts
- 🌐 Multi-currency support
- 🔍 Search functionality
- 📊 Analytics integration

## Getting Started

Detailed setup instructions and documentation will be provided in subsequent sections.

## Architecture

The project consists of two main components:
- Backend: Medusa-powered e-commerce engine
- Frontend: Next.js-based storefront

## Project Structure

The project follows a modular architecture with separate directories for backend, frontend, and configuration:

```
.
├── README.md
├── LICENSE.md
├── .editorconfig
├── .gitignore
├── compose.yaml
├── compose.yaml.dist
├── server.Dockerfile
├── storefront.Dockerfile
├── backend-develop.sh
├── run.sh
├── medusa-store/
│   ├── src/
│   ├── package.json
│   └── medusa-config.js
└── medusa-store-storefront/
    ├── src/
    ├── public/
    └── package.json
```

- `medusa-store/`: Contains the Medusa backend implementation
- `medusa-store-storefront/`: Houses the Next.js frontend application
- `compose.yaml`: Docker Compose configuration for containerized deployment
- `*.Dockerfile`: Container definitions for backend and frontend
- `*.sh`: Utility scripts for development and deployment

## Development

Instructions for local development setup will be provided.

## Deployment

Deployment guidelines and best practices will be documented.

## Contributing

We welcome contributions! Please read our contributing guidelines to get started.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Credits

Developed and maintained by [Convesio Inc.](https://convesio.com)

Based on:
- [Medusa](https://github.com/medusajs/medusa)
- [Docker Medusa](https://github.com/medusajs/docker-medusa)
- [Next.js Starter Medusa](https://github.com/medusajs/nextjs-starter-medusa)

## Support

For support and inquiries, please contact Convesio Inc. through our [website](https://convesio.com).
