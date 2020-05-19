This package moved to https://github.com/spacetab-io/docker-nginx-static
-----------------

# Контейнер для статики (6 mb)

[![CircleCI](https://circleci.com/gh/teamcio/docker-nginx-static.svg?style=svg)](https://circleci.com/gh/teamcio/docker-nginx-static)

Поддерживает PushState для history API.

Пример `Dockerfile`'a для проекта.
```
FROM rg.teamc.io/teamc.io/docker/static:latest

# dist/ - папка с index.html
COPY dist/ /usr/share/nginx/html

# Это обязательно!
USER root
RUN chown -R www-data:www-data /usr/share/nginx/html
USER www-data
```

## Порты

* 8080

## ENV переменные

```
ENV PORT 8080
ENV NGINX_WEBROOT /usr/share/nginx/html
ENV BASIC_AUTH_ENABLE false
ENV HTPASSWD 'foo:$apr1$odHl5EJN$KbxMfo86Qdve2FH4owePn.'
```

При включении Basic Auth, `foo:bar` логин/пароль по умолчанию.

Можно добавить больше пользователей:
```
HTPASSWD 'foo:$apr1$odHl5EJN$KbxMfo86Qdve2FH4owePn.\ntest:$apr1$LKkW8P4Y$P1X/r2YyaexhVL1LzZAQm.'
```

В примере 2 штуки, `foo:bar` и `test:test`.

## Запуск

```
make run
```

или

```
docker run --rm -it -p 8080:8080 rg.teamc.io/teamc.io/docker/static:latest
```

## Проверка работоспособности

```
curl http://localhost:8080
```
