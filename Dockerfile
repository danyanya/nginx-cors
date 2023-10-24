
FROM nginx:1.25-alpine

RUN apk add -U dcron bash curl
COPY default.conf /etc/nginx/conf.d/default.conf
COPY healthcheck.sh /
COPY start.sh /
RUN crontab -l | { cat; echo "* * * * * bash /healthcheck.sh"; } | crontab -

ENTRYPOINT /start.sh