# Stage 1: Build the React application
FROM node:20.19.0-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json for dependency installation
# This is done first to leverage Docker's layer caching.
COPY package.json package-lock.json ./

# Install dependencies using npm ci for clean, reproducible builds
RUN npm ci

# Copy the rest of the application source code
COPY . .

# Build the application for production
# The output will be in the /app/dist directory
RUN npm run build

# Stage 2: Serve the application with Nginx
FROM nginx:stable-alpine AS production

# Copy the build output from the 'build' stage to the Nginx public directory
COPY --from=build /app/dist /usr/share/nginx/html

# Copy the custom Nginx configuration
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

# Copy the entrypoint script and make it executable
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint script to be executed when the container starts
ENTRYPOINT ["/entrypoint.sh"]

# Expose port 80 for incoming traffic
EXPOSE 80

# Start Nginx when the container launches. This command is passed to the entrypoint script.
CMD ["nginx", "-g", "daemon off;"]
