FROM shakyshane/nginx-cors

RUN apk add -U dcron bash curl
COPY healthcheck.sh /
RUN chmod +x /healthcheck.sh
RUN crontab -l | { cat; echo "* * * * * bash /healthcheck.sh"; } | crontab -

ENTRYPOINT /start.sh