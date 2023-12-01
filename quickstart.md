## Installation
### Binary
You can download the latest binary from [release page](https://github.com/synctv-org/synctv/releases) and install it manually.

### Script
You can use the script to install and run SyncTV.

```bash
sudo -v ; curl https://raw.githubusercontent.com/synctv-org/synctv/main/script/install.sh | sudo bash -s -- -v latest
```

#### Linux Service

After installing with `Script`, you can use the following commands
```bash
systemctl start synctv.service # start

systemctl stop synctv.service # stop

systemctl restart synctv.service # restart

systemctl enable synctv.service # disable auto start

systemctl disable synctv.service # disable auto start
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