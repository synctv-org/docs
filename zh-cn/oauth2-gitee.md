# Gitee
## 注册应用
前往Gitee的 [OAuth应用注册地址](https://gitee.com/oauth/applications/new)。

- `应用名称` 填写任意值，如填写为 `SyncTV`
- `应用主页` 填写 `https://<your-domain>`
- `应用描述` 可以不填写
- `应用回调地址` 填写 `https://<your-domain>/web/oauth2/callback/gitee`
- `权限` 仅需勾选user_info即可

填写完毕后点击 `创建应用` 按钮。

<img width="350px" alt="oauth2-gitee" src="/img/oauth2/oauth2-gitee.jpg"/>

## 获取 Client ID 和 Client Secret
注册成功后，页面会跳转到应用的详情页，此时可以看到 `Client ID` 和 `Client Secret`。

如果跳转失败可以在 [OAuth应用列表](https://gitee.com/oauth/applications) 中找到刚刚创建的应用，点击进入详情页。

Gitee与Github不同，Client ID和Client Secret随时可查看

<img width="350px" alt="oauth2-gitee-client" src="/img/oauth2/oauth2-gitee-client.jpg"/>

## 填写配置
在 `config.yaml` 中的oauth2下的providers中添加填写一个gitee的配置

```yaml
oauth2:
    providers:
        gitee:
            client_id: xxxxxx
            client_secret: xxxxxx
            redirect_url: ""
```

`redirect_url` 填写你的应用回调地址