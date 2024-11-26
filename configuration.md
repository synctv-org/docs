# Configuration

> Environment variables have the `SYNCTV_` prefix by default, such as `SYNCTV_DATABASE_TYPE`.
>
> If a prefix is not required, the `--env-no-prefix` parameter can be used.

## log

### enable

- Type: `bool`
- Default: `true`
- Environment variable: `LOG_ENABLE`

### log_format

- Type: `string`
- Default: `text`
- Optional values: `text`, `json`
- Environment variable: `LOG_FORMAT`

### file_path

- Type: `string`
- Default: `log/log.log`
- Environment variable: `LOG_FILE_PATH`

If the path is relative, it is relative to `data-dir`.

### max_size

- Type: `int`
- Default: `10`
- Unit: `MB`
- Environment variable: `LOG_MAX_SIZE`

The maximum size of a single log file. If it exceeds this size, it will be automatically split.

### max_backups

- Type: `int`
- Default: `10`
- Environment variable: `LOG_MAX_BACKUPS`

Maximum number of historical log file backups

### max_age

- Type: `int`
- Default: `28`
- Unit: `days`
- Environment variable: `LOG_MAX_AGE`

Maximum number of days to keep historical log files

### compress

- Type: `bool`
- Default: `false`
- Environment variable: `LOG_COMPRESS`

Whether to compress historical log files

----

## server

### http

#### listen

- Type: `string`
- Default: `0.0.0.0`
- Environment variable: `SERVER_LISTEN`

#### port

- Type: `uint16`
- Default: `8080`
- Environment variable: `SERVER_PORT`

#### cert_path

- Type: `string`
- Environment variable: `SERVER_CERT_PATH`

#### key_path

- Type: `string`
- Environment variable: `SERVER_KEY_PATH`

### rtmp

#### enable

- Type: `bool`
- Default: `true`
- Environment variable: `RTMP_ENABLE`

#### listen

- Type: `string`
- Environment variable: `RTMP_LISTEN`

Uses http listen by default

#### port

- Type: `uint16`
- Default: `0`
- Environment variable: `RTMP_PORT`

Uses server port by default

### proxy_cache_path

- Type: `string`
- Environment variable: `SERVER_PROXY_CACHE_PATH`

Proxy cache storage path, empty means using memory cache

### proxy_cache_size

- Type: `string`
- Environment variable: `SERVER_PROXY_CACHE_SIZE`

Maximum proxy cache size, e.g.: 1MB 1GB, default 1GB

----

## jwt

### secret

- Type: `string`
- Default: Automatically generated on first startup
- Environment variable: `JWT_SECRET`

### expire

- Type: `string`
- Default: `48h`
- Environment variable: `JWT_EXPIRE`

----

## database

### type

- Type: `string`
- Default: `sqlite3`
- Optional values: `sqlite3`, `mysql`, `postgres`
- Environment variable: `DATABASE_TYPE`

### host

- Type: `string`
- Environment variable: `DATABASE_HOST`

When `type` is not `sqlite3` and `port` is 0, the `unix` method will be used to connect to the database.

### port

- Type: `uint16`
- Default: `0`
- Environment variable: `DATABASE_PORT`

### user

- Type: `string`
- Environment variable: `DATABASE_USER`

### password

- Type: `string`
- Environment variable: `DATABASE_PASSWORD`

### name

- Type: `string`
- Default: `synctv`
- Environment variable: `DATABASE_NAME`

When `type` is `sqlite3`, this value is the database file path or memory. If the path is relative, it is relative to `data-dir`.
If `type` is `mysql` or `postgres`, this value is the database name.

### ssl_mode

- Type: `string`
- Environment variable: `DATABASE_SSL_MODE`

mysql: true, false, skip-verify, preferred, <name>
postgres: disable, require, verify-ca, verify-full

### custom_dsn

- Type: `string`
- Environment variable: `DATABASE_CUSTOM_DSN`

When the value is not empty, this value will be used as the database connection string, ignoring other configurations.

### max_idle_conns

- Type: `int`
- Default: `4`
- Environment variable: `DATABASE_MAX_IDLE_CONNS`

Maximum number of idle connections (`sqlite3` not supported)

### max_open_conns

- Type: `int`
- Default: `64`
- Environment variable: `DATABASE_MAX_OPEN_CONNS`

Maximum number of connections (`sqlite3` not supported)

### conn_max_lifetime

- Type: `string`
- Default: `2h`
- Environment variable: `DATABASE_CONN_MAX_LIFETIME`

Maximum connection lifetime (`sqlite3` not supported)

### conn_max_idle_time

- Type: `string`
- Default: `30m`
- Environment variable: `DATABASE_CONN_MAX_IDLE_TIME`

Maximum idle time for connections (`sqlite3` not supported)

----

## oauth2_plugins

- Format:

```yaml
oauth2_plugins:
    - plugin_file: plugins/gitee
      arges: []
```

- plugin_file: Plugin file path, if the path is relative, it is relative to `data-dir`.
- arges: Plugin command line arguments

For plugin writing, please refer to [oauth2 plugin](/zh-cn/write-a-oauth2-plugin.md)

----

## rate_limit

### enable

- Type: `bool`
- Default: `false`
- Environment variable: `RATE_LIMIT_ENABLE`

### period

- Type: `string`
- Default: `1m`
- Environment variable: `RATE_LIMIT_PERIOD`

### limit

- Type: `int`
- Default: `300`
- Environment variable: `RATE_LIMIT_LIMIT`

### trust_forward_header

- Type: `bool`
- Default: `false`
- Environment variable: `RATE_LIMIT_TRUST_FORWARD_HEADER`

Configure the limiter to trust the X-Real-IP and X-Forwarded-For headers. Note that if your reverse proxy is not properly configured to forward trusted client IPs, using this option may be unsafe (i.e., spoofing headers).

### trusted_client_ip_header

- Type: `string`
- Environment variable: `RATE_LIMIT_TRUSTED_CLIENT_IP_HEADER`

Configure the limiter to use custom headers to get the user IP. Note that if your reverse proxy is not properly configured to forward trusted client IPs, using this option may be unsafe (i.e., spoofing headers).
