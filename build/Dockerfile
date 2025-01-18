FROM node:14 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2: Serve the application with Nginx
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY . /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

