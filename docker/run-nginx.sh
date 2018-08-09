#!/usr/bin/env sh

export DOLLAR='$'

export NGINX_WEBROOT=${NGINX_WEBROOT:="/usr/share/nginx/html"}
export NGINX_CLIENT_HEADER_TIMEOUT=${NGINX_CLIENT_HEADER_TIMEOUT:="10s"}
export NGINX_CLIENT_BODY_TIMEOUT=${NGINX_CLIENT_BODY_TIMEOUT:="120s"}
export NGINX_MAX_BODY_SIZE=${NGINX_MAX_BODY_SIZE:="120m"}

if [ "$BASIC_AUTH_ENABLE" = true ]; then
    envsubst < /docker/templates/auth.htpasswd > /etc/nginx/conf.d/auth.htpasswd
    envsubst < /docker/templates/auth.conf > /etc/nginx/conf.d/default.conf
else
    envsubst < /docker/templates/site.conf > /etc/nginx/conf.d/default.conf
fi

nginx -g "daemon off;"

