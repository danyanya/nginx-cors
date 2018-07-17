echo "Adding $TARGET_DOMAIN to the NGINX config"
sed -i -e "s,___TARGET_DOMAIN___,$TARGET_DOMAIN,g" /etc/nginx/conf.d/default.conf

echo "Running crond to do healthchecks"
crond &

echo "Starting nginx server"
nginx -g 'daemon off;'