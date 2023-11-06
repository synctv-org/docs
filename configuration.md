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
- Default value: `10`
- Unit: `MB`
- Environment variable: `LOG_MAX_SIZE`

The maximum size of a single log file. If it exceeds this size, it will be automatically split.

### max_backups
- Type: `int`
- Default value: `10`
- Environment variable: `LOG_MAX_BACKUPS`

Maximum number of historical log file backups

### max_age
- Type: `int`
- Default value: `28`
- Unit: `day`
- Environment variable: `LOG_MAX_AGE`

Maximum number of days to save historical log files

### compress
- Type: `bool`
- Default value: `false`
- Environment variable: `LOG_COMPRESS`

Whether to compress historical log files

----

## server
### listen
- Type: `string`
- Default value: `0.0.0.0`
- Environment variable: `SERVER_LISTEN`

### port
- Type: `int`
- Default: `8080`
- Environment variable: `SERVER_PORT`

### quic
- Type: `bool`
- Default: `true`
- Environment variable: `SERVER_QUIC`

To enable QUIC/HTTP3, `tls` must be enabled to take effect.

### cert_path
- Type: `string`
- Environment variable: `SERVER_CERT_PATH`

### key_path
- Type: `string`
- Environment variable: `SERVER_KEY_PATH`

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

## rtmp
### enable
- Type: `bool`
- Default: `true`
- Environment variable: `RTMP_ENABLE`

Can create rtmp video stream or proxy rtmp/flv live stream.

### port
- Type: `int`
- Default value: `0`
- Environment variable: `RTMP_PORT`

When the value is `0`, the value of `server.port` will be used.

### custom_publish_host
- Type: `string`
- Environment variable: `RTMP_CUSTOM_PUBLISH_HOST`

When the value is not empty, this value will be used as the host of the rtmp push address to be displayed on the front end, otherwise the host of the current request will be used.
If you are using a reverse proxy, you may need to set this value.

### rtmp_player
- Type: `bool`
- Default value: `false`
- Environment variable: `RTMP_RTMP_PLAYER`

Whether the created rtmp video stream can be played by rtmp player. Since rtmp player is not suitable for authentication (unsafe), it is not enabled by default.

----

## proxy
### movie_proxy
- Type: `bool`
- Default: `true`
- Environment variable: `PROXY_MOVIE_PROXY`

Whether to allow the creation of proxies for normal videos.

### live_proxy
- Type: `bool`
- Default: `true`
- Environment variable: `PROXY_LIVE_PROXY`

Whether to allow the creation of proxies for live video.

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
- Type: `int`
- Default value: `0`
- Environment variable: `DATABASE_PORT`

### user
- Type: `string`
- Environment variable: `DATABASE_USER`

### password
- Type: `string`
- Environment variable: `DATABASE_PASSWORD`

### db_name
- Type: `string`
- Default: `synctv`
- Optional value: `sqlite3` can be set to `memory`
- Environment variable: `DATABASE_DB_NAME`

When `type` is `sqlite3`, the value is the database file path, or relative to `data-dir` if the path is relative.
If `type` is `mysql` or `postgres`, the value is the database name.

### ssl_mode
- Type: `string`
- Default: `disable`
- Optional values: `disable`, `require`, `verify-ca`, `verify-full`
- Environment variable: `DATABASE_SSL_MODE`

### custom_dsn
- Type: `string`
- Environment variable: `DATABASE_CUSTOM_DSN`

When the value is not empty, the value is used as the database connection string and other configurations are ignored.

### max_idle_conns
- Type: `int`
- Default value: `4`
- Environment variable: `DATABASE_MAX_IDLE_CONNS`

Maximum number of idle connections (not supported by `sqlite3`)

### max_open_conns
- Type: `int`
- Default value: `64`
- Environment variable: `DATABASE_MAX_OPEN_CONNS`

Maximum number of connections (not supported by `sqlite3`)

### conn_max_lifetime
- Type: `string`
- Default value: `1h`
- Environment variable: `DATABASE_CONN_MAX_LIFETIME`

Maximum connection lifetime (not supported by `sqlite3`)

### conn_max_idle_time
- Type: `string`
- Default: `30m`
- Environment variable: `DATABASE_CONN_MAX_IDLE_TIME`

Maximum idle time of connection (not supported by `sqlite3`)

----

## oauth2
### providers
- Format:
```yaml
providers:
     github:
         client_id: 676671xxx
         client_secret: 021256xxx
         redirect_url: ""
     microsoft:
         client_id: 2b914dxxx
         client_secret: mdr8Q~xxx
         redirect_url: ""
```
- Optional values: `github`, `microsoft`, `google`, `gitee`, `baidu`, `baidu-netdisk`

oauth2 service provider

### plugins
- Format:
```yaml
plugins:
     - plugin_file: plugins/gitee
       arges: []
```

plugin_file: plugin file path, relative to `data-dir` if the path is relative.

arges: plugin command line parameters

For how to write the plug-in, please refer to [oauth2 plug-in](/zh-cn/write-a-oauth2-plugin.md)

----

## rate_limit
### enable
- Type: `bool`
- Default value: `false`
- Environment variable: `RATE_LIMIT_ENABLE`

### period
- Type: `string`
- Default: `1m`
- Environment variable: `RATE_LIMIT_PERIOD`

### limit
- Type: `int`
- Default value: `300`
- Environment variable: `RATE_LIMIT_LIMIT`

### trust_forward_header
- Type: `bool`
- Default value: `false`
- Environment variable: `RATE_LIMIT_TRUST_FORWARD_HEADER`

Configure the limiter to trust the X-Real-IP and X-Forwarded-For headers. Note that using this option may be insecure (ie: forging headers) if your reverse proxy is not properly configured to forward trusted client IPs.

### trusted_client_ip_header
- Type: `string`
- Environment variable: `RATE_LIMIT_TRUSTED_CLIENT_IP_HEADER`

Configure the limiter to use custom header information to obtain the user IP. Note that using this option may be insecure (ie: forging headers) if your reverse proxy is not properly configured to forward trusted client IPs.