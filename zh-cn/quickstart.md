## 安装方式
### 二进制
您可以从[发布页面](https://github.com/synctv-org/synctv/releases)下载最新的二进制文件并手动安装。

### 一键脚本
您可以使用该脚本来安装和运行 SyncTV。

```bash
sudo -v ; curl https://raw.githubusercontent.com/synctv-org/synctv/main/script/install.sh | sudo bash -s -- -v latest
```

### Docker
您也可以使用 docker 安装并运行 SyncTV。

```bash
docker run -d --name synctv -p 8080:8080 synctvorg/synctv
```

有关 docker 镜像的更多信息，请参阅[此处](https://hub.docker.com/r/synctvorg/synctv)。

## Linux服务

使用`一键脚本`安装后可以使用以下命令
```bash
重启：systemctl restart synctv.service

启动：systemctl start synctv.service

停止：systemctl stop synctv.service

禁用：systemctl disable synctv.service

```

----

## 用法
### 全局标志
```bash
-f, --config string            config file path
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

## 启动服务器
```bash
synctv server --data-dir ./
```
