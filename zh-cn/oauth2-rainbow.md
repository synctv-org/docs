# 彩虹聚合登录
- [官方链接](https://www.clogin.cc)

- [小白聚合(官方授权站)](https://u.xiaobaixuan.com/)
  - 可免费使用 `qq` 登录

## 注册应用
这里以 [小白聚合(官方授权站)](https://u.xiaobaixuan.com/) 为例子，来开启小白聚合提供的免费 `qq` 登录通道。

首先 [注册登录](https://u.xiaobaixuan.com/user/login.php) 小白聚合官方授权站，然后在授权站上 [创建应用](https://u.xiaobaixuan.com/user/appadd.php)。

- `应用名称` 随意填写，如填写 `synctv`
- `应用首页网址` 填写你的网站地址，如 `https://demo.synctv.wiki`
- `回调域名白名单` 只需要填写主域名即可，如 `synctv.wiki`
  - 如果你的网站带端口号，如 `http://127.0.0.1:8080`，也只需要需要填写 `127.0.0.1`

## 获取 Client ID 和 Client Secret
创建完毕后前往 [应用列表](https://u.xiaobaixuan.com/user/appinfo.php) 找到刚刚创建的应用，点击 `应用详情`。

- APPID 为 Client ID
- APPKEY 为 Client Secret

## 填写配置
- Oauth2_rainbow_api 填写彩虹登录接口地址，如这里演示的 `小白聚合` 填写为 `https://u.xiaobaixuan.com`
- Oauth2_rainbow_enabled 代表开关 开启即可
- Oauth2_rainbow_enabled_list 填写需要开启的应用 如 `qq`
  - 多个通道用 `,` 分隔 如 `qq,wx`

> 注意:
> 
> 修改完配置后需要重启服务才能生效

通道列表可在 [彩虹聚合文档](https://u.cccyun.cc/doc.php) 中查看

如：

| 对应值 | 登录方式名称 |
| ------ | ------------ |
| qq     | QQ           |
| wx     | 微信         |
| alipay | 支付宝       |

## 重启后填写配置
重启后会在 `oauth2` 设置中看到对应的设置项

如 `qq` 配置项：
- `Client ID` 填写 `APPID`
- `Client Secret` 填写 `APPKEY`
- `Redirect url` 填写 `https://<your-domain>/web/oauth2/callback/qq`

配置好后启用 `qq oauth2` 即可

> wx 的 `重定向` 地址为：
> 
>  `https://<your-domain>/web/oauth2/callback/wechat`
>
> 而不是：
> 
>  `https://<your-domain>/web/oauth2/callback/wx`