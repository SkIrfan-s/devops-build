FROM nginx:stable-perl
WORKDIR /usr/share/nginx/html
# Clear existing content
RUN rm -rf ./*
COPY * .
ENTRYPOINT ["nginx", "-g", "daemon off;"]

