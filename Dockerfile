# Description: Dockerfile for building and running the frontend application

# Get the base image
FROM node:18-alpine as builder
# Set the working directory
WORKDIR /app
# Copy the package.json files
COPY package*.json .
# Install the dependencies
RUN npm install
# Copy the source code
COPY . .
# Expose the port
EXPOSE 3000
# Run the application
CMD ["npm", "start"]



