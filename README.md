# gitea-selfhosted

## Gitea

Generate key & token and insert in `GITEA__security__SECRET_KEY` & `GITEA__security__INTERNAL_TOKEN`

```sh
docker run -it --rm docker.gitea.com/gitea:1.26.4 gitea generate secret SECRET_KEY
docker run -it --rm docker.gitea.com/gitea:1.26.4 gitea generate secret INTERNAL_TOKEN
```

## Drone

### Drone Webhook

If hook don't created by Drone server, create it manually on `https://gitea.local/user/settings/hooks`

Set `Target URL: https://drone-server.local`

Gitea then will send request to drone-server.local, docker dns will see nginx alias and route request to it. Nginx next proxy pass to drone-server container

### Drone OAuth login via Gitea setup

For first `docker compose up -d` set any values in .env for `DRONE_GITEA_CLIENT_ID` and `DRONE_GITEA_CLIENT_SECRET`, after OAuth app created copy actual values and up drone-server again

1. Create new Oauth app in Gitea at `https://gitea.local/user/settings/applications`
2. Set Redirect url to `https://drone-server.local/login`
3. Copy `Client ID` and `Client Secret` and insert in .env vars `DRONE_GITEA_CLIENT_ID` and `DRONE_GITEA_CLIENT_SECRET`
4. Save
5. `docker compose up -d gitea drone-server --force-recreate`

## Запуск локального SSL

1. Install mkcert `apt install mkcert`
2. Install root CA certs `mkcert -install`
3. If install failed for browser - manual install. `mkcert -CAROOT` get path to root CA certs. Then install for Chrome at `hrome://certificate-manager`
4. Сгенерируйте сертификаты:

```sh
  cd src/certs && mkcert gitea.local pgadmin.local drone-server.local && cd -

  # copy root cert for drone server and runner
  cp $(mkcert -CAROOT)/rootCA.pem src/certs/
```
