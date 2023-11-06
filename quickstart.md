## Installation
### Binary
You can download the latest binary from [release page](https://github.com/synctv-org/synctv/releases) and install it manually.

### Script
You can use the script to install and run SyncTV.

```bash
sudo -v ; curl https://raw.githubusercontent.com/synctv-org/synctv/main/install.sh | sudo bash -s -- -v latest
```

### Docker
You can also use docker to install and run SyncTV.

```bash
docker run -d --name synctv -p 8080:8080 synctvorg/synctv
```

More information about docker image, please see [here](https://hub.docker.com/r/synctvorg/synctv).

----

## Usage
### Global Flags
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

## Start Server
```bash
synctv server --data-dir ./
```