#!/usr/bin/env sh

export DOLLAR='$'

if [ "$BASIC_AUTH_ENABLE" = true ]; then
    envsubst < /docker/templates/auth.htpasswd > /etc/nginx/conf.d/auth.htpasswd
    envsubst < /docker/templates/auth.conf > /etc/nginx/conf.d/default.conf
else
    envsubst < /docker/templates/site.conf > /etc/nginx/conf.d/default.conf
fi

nginx -g "daemon off;"

