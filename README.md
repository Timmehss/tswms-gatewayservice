# Gateway API Docker Setup

This document provides essential commands for managing the Docker setup of the Gateway API application. Below are the commands listing and an overview of the project's structure.

## Project Structure

- **TSWMS.GatewayService.Api**: The main entry point for the Gateway API, hosting the API interfaces. It handles incoming requests and routes them to the appropriate services using Ocelot API Gateway.

## Docker Commands

### 1. Docker Compose for docker-compose.prod.yml (All services)

To start the Gateway API along with all related services (Order Service, Product Service, RabbitMQ, Databases, etc.), use the following command:

```bash
docker-compose -f docker-compose.prod.yml -p tswms up --pull always --detach
```
