# Task on Docker Topic

## This task involves setting up Docker containers for both the API and UI components of the application

1. Setting up Docker container for the API component
  - Create a Dockerfile in the `api` directory and name it `Dockerfile-dev`.
  - Use Node.js version 16 as the base image in the Dockerfile.
  - Configure the container to run on port `3080`.
  - Set the working directory to `/usr/src/app/api` in the Dockerfile.

2. Setting up Docker container for the UI component
  - Create a Dockerfile in the `ui` directory and name it `Dockerfile-dev`.
  - Use Node.js version 16 as the base image in the Dockerfile.
  - Configure the container to run on port `4201`.
  - Set the working directory to `/usr/src/app/app-ui/` in the Dockerfile.

3. Setting up API server
  - In root directory create a new file named `docker-compose.yml`.
  - Define the first service named `nodejs-server` in the Docker Compose file.
  - Specify the Dockerfile for this service as `Dockerfile-dev` located in the `api` directory.
  - Set the service to run on port `3080`. 

4. Setting up UI server
  - Define the second service named `angular-ui` in the Docker Compose file.
  - Specify the Dockerfile for this service as `Dockerfile-dev` located in the `ui` directory.
  - Set the service to run on port `4201`.
