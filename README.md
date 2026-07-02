# gitea-selfhosted

## Gitea

Generate key & token and insert in `GITEA__security__SECRET_KEY` & `GITEA__security__INTERNAL_TOKEN`

```sh
docker run -it --rm docker.gitea.com/gitea:1.26.4 gitea generate secret SECRET_KEY
docker run -it --rm docker.gitea.com/gitea:1.26.4 gitea generate secret INTERNAL_TOKEN
```

## Запуск локального SSL

1. Установите mkcert `apt install mkcert`
2. Выполните: `mkcert -install`
3. Сгенерируйте сертификаты:

```sh
  mkcert -cert-file ./src/certs/gitea.local.crt -key-file ./src/certs/gitea.local.key gitea.local *.gitea.local
```
