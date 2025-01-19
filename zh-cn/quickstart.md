## 安装方式

### 二进制

您可以从[发布页面](https://github.com/synctv-org/synctv/releases)下载最新的二进制文件并手动安装。

### 一键脚本

您可以使用该脚本来安装和运行 SyncTV。

```bash
sudo -v ; curl -fsSL https://raw.gitmirror.com/synctv-org/synctv/main/script/install.sh | sudo bash -s -- -v latest
```

#### Linux服务

使用 `一键脚本` 安装后可以使用以下命令

```bash
systemctl start synctv.service # 启动

systemctl stop synctv.service # 停止

systemctl restart synctv.service # 重启

systemctl enable synctv.service # 开启自启动

systemctl disable synctv.service # 关闭自启动
```

### Docker

您也可以使用 docker 安装并运行 SyncTV。

```bash
docker run -d --name synctv -p 8080:8080 synctvorg/synctv
```

有关 docker 镜像的更多信息，请参阅[此处](https://hub.docker.com/r/synctvorg/synctv)。

### Docker Compose

> 最新示例文件请参考 [docker-compose.yml](https://github.com/synctv-org/synctv/blob/main/script/docker-compose.yml)

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

> 更多 Helm 参数:[helm-values](helm-values.md)

#### Helm Uninstall

```bash
helm uninstall -n synctv synctv
```

----

## 用法

### 全局标志

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

### 命令

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

### 运行

`synctv server` 启动服务器

```bash
synctv server
# or
synctv server --data-dir ./
```

> 每次启动会检测是否有root权限的用户，如果没有则会初始化一个`root`用户，密码为`root`，请及时修改用户名密码。
>
> 用户注册功能需要启用任意 `OAuth2` 服务，如 `Google`、`Github` 等等，具体配置请参考[文档](/zh-cn/oauth2)。
