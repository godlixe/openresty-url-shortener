# Use the official OpenResty image based on Alpine Linux
FROM openresty/openresty:1.21.4.1-0-alpine

# Set the maintainer label
LABEL maintainer="alexander19id@gmail.com"

# Copy your custom nginx.conf into the container
COPY ./nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

# Expose necessary ports (these can be configured via Kubernetes service, not in Dockerfile)
# Exposing here is optional for Kubernetes, you typically manage port exposure in your Service resource
EXPOSE 80
EXPOSE 443
