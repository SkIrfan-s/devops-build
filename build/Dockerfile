FROM node:14 as build

# Sijijet the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application


# Stage 2: Serve the application with Apache HTTP Server
FROM httpd:alpine
COPY . /usr/local/apache2/htdocs/
EXPOSE 80
CMD ["httpd-foreground"]
