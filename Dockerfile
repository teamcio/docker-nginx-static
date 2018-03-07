FROM nginx:mainline-alpine

# foo:bar by default
ENV BASIC_AUTH_ENABLE false
ENV HTPASSWD 'foo:$apr1$odHl5EJN$KbxMfo86Qdve2FH4owePn.'
ENV NGINX_WEBROOT /usr/share/nginx/html
ENV PORT 8080

COPY docker/ /docker
COPY ./docker/index.html /usr/share/nginx/html
COPY ./docker/nginx.conf /etc/nginx/nginx.conf

RUN adduser -D www-data \
    && chown -R www-data:www-data /usr/share/nginx/html \
    && chown -R www-data:www-data /etc/nginx/conf.d

USER www-data
WORKDIR /usr/share/nginx/html

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

CMD ["/docker/run-nginx.sh"]
