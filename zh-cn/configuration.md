# 配置

> 环境变量默认有 `SYNCTV_` 前缀，例如 `SYNCTV_DATABASE_TYPE`。
>
> 如果不需要前缀，可以使用 `--env-no-prefix` 参数。

## log
### enable
- 类型: `bool`
- 默认值: `true`
- 环境变量: `LOG_ENABLE`

### log_format
- 类型: `string`
- 默认值: `text`
- 可选值: `text`, `json`
- 环境变量: `LOG_FORMAT`

### file_path
- 类型: `string`
- 默认值: `log/log.log`
- 环境变量: `LOG_FILE_PATH`

如果路径为相对路径，则相对于 `data-dir`。

### max_size
- 类型: `int`
- 默认值: `10`
- 单位: `MB`
- 环境变量: `LOG_MAX_SIZE`

单个日志文件最大大小，超过该大小则会自动分割。

### max_backups
- 类型: `int`
- 默认值: `10`
- 环境变量: `LOG_MAX_BACKUPS`

历史日志文件最大备份数量

### max_age
- 类型: `int`
- 默认值: `28`
- 单位: `天`
- 环境变量: `LOG_MAX_AGE`

历史日志文件最大保存天数

### compress
- 类型: `bool`
- 默认值: `false`
- 环境变量: `LOG_COMPRESS`

是否压缩历史日志文件

----

## server
### listen
- 类型: `string`
- 默认值: `0.0.0.0`
- 环境变量: `SERVER_LISTEN`

### port
- 类型: `int`
- 默认值: `8080`
- 环境变量: `SERVER_PORT`

### quic
- 类型: `bool`
- 默认值: `true`
- 环境变量: `SERVER_QUIC`

启用 QUIC/HTTP3，必须在 `tls` 启用的情况下才能生效。

### cert_path
- 类型: `string`
- 环境变量: `SERVER_CERT_PATH`

### key_path
- 类型: `string`
- 环境变量: `SERVER_KEY_PATH`

----

## jwt
### secret
- 类型: `string`
- 默认值: 首次启动时自动生成
- 环境变量: `JWT_SECRET`

### expire
- 类型: `string`
- 默认值: `48h`
- 环境变量: `JWT_EXPIRE`

----

## rtmp
### enable
- 类型: `bool`
- 默认值: `true`
- 环境变量: `RTMP_ENABLE`

可以创建rtmp视频流或代理rtmp/flv直播流。

### port
- 类型: `int`
- 默认值: `0`
- 环境变量: `RTMP_PORT`

当值为 `0` 时，会使用`server.port`的值。

### custom_publish_host
- 类型: `string`
- 环境变量: `RTMP_CUSTOM_PUBLISH_HOST`

当值不为空时，会使用该值作为rtmp推流地址的host在前端显示，否则会使用当前请求的host。
如果你使用了反向代理，那么你可能需要设置该值。

### rtmp_player
- 类型: `bool`
- 默认值: `false`
- 环境变量: `RTMP_RTMP_PLAYER`

创建的rtmp视频流是否可以被rtmp播放器播放，由于rtmp播放器不适合做鉴权（不安全），所以默认不开启。

----

## proxy
### movie_proxy
- 类型: `bool`
- 默认值: `true`
- 环境变量: `PROXY_MOVIE_PROXY`

是否允许创建普通视频的代理。

### live_proxy
- 类型: `bool`
- 默认值: `true`
- 环境变量: `PROXY_LIVE_PROXY`

是否允许创建直播视频的代理。

----

## database
### type
- 类型: `string`
- 默认值: `sqlite3`
- 可选值: `sqlite3`, `mysql`, `postgres`
- 环境变量: `DATABASE_TYPE`

### host
- 类型: `string`
- 环境变量: `DATABASE_HOST`

当 `type` 不为 `sqlite3` 且 `port` 为 0 时，会使用 `unix` 的方式连接数据库。

### port
- 类型: `int`
- 默认值: `0`
- 环境变量: `DATABASE_PORT`

### user
- 类型: `string`
- 环境变量: `DATABASE_USER`

### password
- 类型: `string`
- 环境变量: `DATABASE_PASSWORD`

### db_name
- 类型: `string`
- 默认值: `synctv`
- 可选值: `sqlite3` 时可设置为 `memory`
- 环境变量: `DATABASE_DB_NAME`

当 `type` 为 `sqlite3` 时，该值为数据库文件路径，如果路径为相对路径，则相对于 `data-dir`。
如果 `type` 为 `mysql` 或 `postgres` 时，该值为数据库名。

### ssl_mode
- 类型: `string`
- 默认值: `disable`
- 可选值: `disable`, `require`, `verify-ca`, `verify-full`
- 环境变量: `DATABASE_SSL_MODE`

### custom_dsn
- 类型: `string`
- 环境变量: `DATABASE_CUSTOM_DSN`

当值不为空时，会使用该值作为数据库连接字符串，忽略其他配置。

### max_idle_conns
- 类型: `int`
- 默认值: `4`
- 环境变量: `DATABASE_MAX_IDLE_CONNS`

最大空闲连接数（`sqlite3` 不支持）

### max_open_conns
- 类型: `int`
- 默认值: `64`
- 环境变量: `DATABASE_MAX_OPEN_CONNS`

最大连接数（`sqlite3` 不支持）

### conn_max_lifetime
- 类型: `string`
- 默认值: `1h`
- 环境变量: `DATABASE_CONN_MAX_LIFETIME`

连接最大生命周期（`sqlite3` 不支持）

### conn_max_idle_time
- 类型: `string`
- 默认值: `30m`
- 环境变量: `DATABASE_CONN_MAX_IDLE_TIME`

连接最大空闲时间（`sqlite3` 不支持）

----

## oauth2
### providers
- 格式:
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
- 可选值: `github`, `microsoft`, `google`, `gitee`, `baidu`, `baidu-netdisk`

oauth2 服务提供商

### plugins
- 格式:
```yaml
plugins:
    - plugin_file: plugins/gitee
      arges: []
```

plugin_file: 插件文件路径，如果路径为相对路径，则相对于 `data-dir`。

arges: 插件命令行参数

插件的编写方式请参考 [oauth2 插件](/zh-cn/write-a-oauth2-plugin.md)

----

## rate_limit
### enable
- 类型: `bool`
- 默认值: `false`
- 环境变量: `RATE_LIMIT_ENABLE`

### period
- 类型: `string`
- 默认值: `1m`
- 环境变量: `RATE_LIMIT_PERIOD`

### limit
- 类型: `int`
- 默认值: `300`
- 环境变量: `RATE_LIMIT_LIMIT`

### trust_forward_header
- 类型: `bool`
- 默认值: `false`
- 环境变量: `RATE_LIMIT_TRUST_FORWARD_HEADER`

将限制器配置为信任X-Real-IP和X-Forwarded-For头信息。请注意，如果您的反向代理没有正确配置以转发可信任的客户端IP，则使用此选项可能会不安全（即：伪造Header）。

### trusted_client_ip_header
- 类型: `string`
- 环境变量: `RATE_LIMIT_TRUSTED_CLIENT_IP_HEADER`

将限制器配置为使用自定义头信息获取用户IP。请注意，如果您的反向代理没有正确配置以转发可信任的客户端IP，则使用此选项可能会不安全（即：伪造Header）。