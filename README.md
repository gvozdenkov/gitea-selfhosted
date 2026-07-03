# gitea-selfhosted

## Gitea

Generate key & token and insert in `GITEA__security__SECRET_KEY` & `GITEA__security__INTERNAL_TOKEN`

```sh
docker run -it --rm docker.gitea.com/gitea:1.26.4 gitea generate secret SECRET_KEY
docker run -it --rm docker.gitea.com/gitea:1.26.4 gitea generate secret INTERNAL_TOKEN
```

Add new remote in with custom ssh port:

```sh
git remote add origin ssh://git@gitea.local:2222/<username>/<repo>.git
```

## Запуск локального SSL

1. Install mkcert `apt install mkcert`
2. Install root CA certs `mkcert -install`
3. If install failed for browser - manual install. `mkcert -CAROOT` get path to root CA certs. Then install for Chrome at `hrome://certificate-manager`
4. Сгенерируйте сертификаты:

```sh
  cd src/certs && mkcert gitea.local pgadmin.local
```
