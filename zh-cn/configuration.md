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

### http

#### listen

- 类型: `string`
- 默认值: `0.0.0.0`
- 环境变量: `SERVER_LISTEN`

#### port

- 类型: `uint16`
- 默认值: `8080`
- 环境变量: `SERVER_PORT`

#### cert_path

- 类型: `string`
- 环境变量: `SERVER_CERT_PATH`

#### key_path

- 类型: `string`
- 环境变量: `SERVER_KEY_PATH`

### rtmp

#### enable

- 类型: `bool`
- 默认值: `true`
- 环境变量: `RTMP_ENABLE`

#### listen

- 类型: `string`
- 环境变量: `RTMP_LISTEN`

默认使用 http listen

#### port

- 类型: `uint16`
- 默认值: `0`
- 环境变量: `RTMP_PORT`

默认使用 server port

### proxy_cache_path

- 类型: `string`
- 环境变量: `SERVER_PROXY_CACHE_PATH`

代理缓存存储路径，为空表示使用内存缓存

### proxy_cache_size

- 类型: `string`
- 环境变量: `SERVER_PROXY_CACHE_SIZE`

代理缓存最大大小，例如：1MB 1GB，默认 1GB

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

- 类型: `uint16`
- 默认值: `0`
- 环境变量: `DATABASE_PORT`

### user

- 类型: `string`
- 环境变量: `DATABASE_USER`

### password

- 类型: `string`
- 环境变量: `DATABASE_PASSWORD`

### name

- 类型: `string`
- 默认值: `synctv`
- 环境变量: `DATABASE_NAME`

当 `type` 为 `sqlite3` 时，该值为数据库文件路径或 memory，如果路径为相对路径，则相对于 `data-dir`。
如果 `type` 为 `mysql` 或 `postgres` 时，该值为数据库名。

### ssl_mode

- 类型: `string`
- 环境变量: `DATABASE_SSL_MODE`

mysql: true, false, skip-verify, preferred, <name>
postgres: disable, require, verify-ca, verify-full

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
- 默认值: `2h`
- 环境变量: `DATABASE_CONN_MAX_LIFETIME`

连接最大生命周期（`sqlite3` 不支持）

### conn_max_idle_time

- 类型: `string`
- 默认值: `30m`
- 环境变量: `DATABASE_CONN_MAX_IDLE_TIME`

连接最大空闲时间（`sqlite3` 不支持）

----

## oauth2_plugins

- 格式:

```yaml
oauth2_plugins:
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
