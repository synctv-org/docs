## Installation

### Binary

You can download the latest binary from [release page](https://github.com/synctv-org/synctv/releases) and install it manually.

### Script

You can use the script to install and run SyncTV.

```bash
sudo -v ; curl -fsSL https://raw.githubusercontent.com/synctv-org/synctv/main/script/install.sh | sudo bash -s -- -v latest
```

#### Linux Service

After installing with `Script`, you can use the following commands

```bash
systemctl start synctv.service # start

systemctl stop synctv.service # stop

systemctl restart synctv.service # restart

systemctl enable synctv.service # enable auto start

systemctl disable synctv.service # disable auto start
```

### Docker

You can also use docker to install and run SyncTV.

```bash
docker run -d --name synctv -p 8080:8080 synctvorg/synctv
```

More information about docker image, please see [here](https://hub.docker.com/r/synctvorg/synctv).

### Docker Compose

> Latest example file please refer to [docker-compose.yml](https://github.com/synctv-org/synctv/blob/main/script/docker-compose.yml)

```yaml
version: '3.3'
services:
  synctv:
    image: 'synctvorg/synctv:latest'
    container_name: synctv
    restart: unless-stopped
    ports:
      - '8080:8080/tcp'
      - '8080:8080/udp'
    volumes:
      - /opt/synctv:/root/.synctv
    environment:
      - PUID=0
      - PGID=0
      - UMASK=022
      - TZ=Asia/Shanghai
```

### Helm

#### Helm Install

```bash
helm repo add synctv https://docs.synctv.wiki/helm-charts
helm search repo synctv
helm pull synctv/synctv
helm upgrade --install synctv synctv/synctv \
  -n synctv --create-namespace \
  --set ingress.enabled=true \
  --set ingress.className=nginx \
  --set 'ingress.hosts[0].host=<yourdomain.com>' \
  --set 'ingress.hosts[0].secretName=<yourdomain-secretName>'
```

#### Helm Upgrade

```bash
helm upgrade --install synctv synctv/synctv \
  -n synctv \
  --reuse-values
```

> More Helm Values:[helm-values](helm-values.md)

#### Helm Uninstall

```bash
helm uninstall -n synctv synctv
```

----

## Usage

### Global Flags

```bash
    --data-dir string          data dir (default "/Users/zijiren/.synctv")
    --dev                      start with dev mode (default true)
    --env-no-prefix            env no SYNCTV_ prefix
    --github-base-url string   github api base url (default "https://api.github.com/")
-h, --help                     help for synctv
    --log-std                  log to std (default true)
    --skip-config              skip config
    --skip-env                 skip env
```

### Commands

```bash
admin       # admin
conf        # init or check
help        # Help about any command
root        # root
self-update # self-update
server      # Start synctv-server
setting     # setting
user        # user
version     # Print the version number of Sync TV Server
```

### Run

`synctv server` to start the server

```bash
synctv server
# or
synctv server --data-dir ./
```

> Every time it starts, it will check for users with root permissions. If none are found, it will initialize a `root` user with the password `root`. Please change the username and password promptly.
>
> The user registration function requires the use of any `OAuth2` service, such as `Google`, `Github`, etc. For specific configuration, please refer to [documentation](/oauth2).
