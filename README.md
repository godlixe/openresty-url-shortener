# OpenResty URL Shortener

Simple in-memory URL Shortener with just OpenResty.

## Overview

This project demonstrates how OpenResty can be used to implement a simple URL shortener using minimal code. 
OpenResty is a high-performance web platform based on NGINX that integrates Lua scripting to enable powerful and flexible web application development. It’s not a traditional web server or framework, but rather a web platform that extends NGINX’s capabilities by allowing you to run Lua code inside the NGINX request handling flow.
This proof-of-concept uses in-memory key-value store (utilizing OpenResty's shared dict with 100m limit) to store the url.

## Running the Project

### Prerequisites
Make sure you have
- Docker or Docker Compose
- Make sure nothing is running on port 8082 and 8083 (you can change it in the Dockerfile/docker-compose.yaml)


### Steps

**Using Dockerfile**:

1. Clone the repository
2. In the project directory, run this command to build the image:

```bash
docker build -t openresty-url-shortener .
```

3. After the image is built, run it using:

```bash
docker run -p 8082:80 -p 8083:443 openresty-url-shortener
```

4. Verify that the container is running by going to the URL `http://localhost:8082` from your browser.

5. Shorten a URL using the endpoint on `http://localhost:8082/set?key=[url_key]&val=[destination_url]`. Destination URL needs to have `http://` or `https://` in front of it.

6. Access the shortened url using the endpoint on `http://localhost:8082/r/[url_key]`


**Using Docker Compose**:

1. Clone the repository
2. In the project directory, run:

```bash
docker compose up -d
```

3. Verify that the container is running by going to the URL `http://localhost:8082` from your browser.

4. Shorten a URL using the endpoint on `http://localhost:8082/set?key=[url_key]&val=[destination_url]`. Destination URL needs to have `http://` or `https://` in front of it.

5. Access the shortened url using the endpoint on `http://localhost:8082/r/[url_key]`

### Example
This example shows how to set the key gugel to go to Google's home page. 

1. Access `http://localhost:8082/set?key=gugel&val=https://www.google.com`.
2. Go to `http://localhost:8082/r/gugel`, it should redirect you to Google's homepage.


## Conclustion
OpenResty is powerful, it has the power of NGINX combined with the flexibility to write our own code with Lua. Other than this URL shortener, you can also create more complex apps with OpenResty.
The URL shortener works fine, but there's some improvement that can be done. The URL shortener can store data in a persistent storage like redis/sqlite/postgresql, to make it more persistent and scalable.
