echo "Adding $TARGET to the NGINX config"
sed -i -e "s,___TARGET___,$TARGET,g" /etc/nginx/conf.d/default.conf

echo "Running crond to do healthchecks"
crond &

echo "Starting nginx server"
nginx -g 'daemon off;'