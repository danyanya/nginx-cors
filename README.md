# nginx-cors

## Cases

CORS headers for POST/OPTIONS needed by browsers to deal with security. This image contains curl-based health checks to check target Nginx upstream.

It’s needed when docker restarts and brakes connection with upstream (502 Bad Gateway can be so). Simple Cron and Nginx reload to try to fix it.

## Usage

Clone in and launch by docker-compose with needed TARGET_DOMAIN and HEALTHCHECK_URL (and exposed CORS_PORT as well): 

```
# cat docker-compose.yml
version: '3'
services:
    nginx-cors:
        build: .
        image: danyanya/nginx-cors
        ports:
            - ${CORS_PORT}:80
        environment:
            - TARGET_DOMAIN=${TARGET_DOMAIN}
            - HEALTHCHECK_URL=${HEALTHCHECK_URL}
        restart: always
        command: sh /start.sh 
        logging:
            driver: "none"
# CORS_PORT=80 TARGET_DOMAIN=backend HEALTCHECK_URL=http://localhost/api/status docker-compose up
```

## Credits

Created by Daniil Sliusar.
Based on repo [shakyShane/nginx-cors-plus](https://github.com/shakyShane/nginx-cors-plus).