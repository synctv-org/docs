# Github
## 注册应用
前往GitHub的 [OAuth应用注册地址](https://github.com/settings/applications/new)。

- `Application name` 填写任意值，如填写为 `SyncTV`
- `Homepage URL` 填写 `https://<your-domain>`
- `Application description` 可以不填写
- `Authorization callback URL` 填写 `https://<your-domain>/web/oauth2/callback/github`
- `Enable Device Flow` 此功能的作用是允许用户在没有浏览器的情况下进行授权，可以不勾选

填写完毕后点击 `Register application` 按钮。

<img width="350px" alt="oauth2-github" src="/img/oauth2/oauth2-github.jpg"/>

## 获取 Client ID 和 Client Secret
注册成功后，页面会跳转到应用的详情页，此时可以看到 `Client ID` 和 `Client Secret`。

如果跳转失败可以在 [OAuth应用列表](https://github.com/settings/developers) 中找到刚刚创建的应用，点击进入详情页。

`Client ID` 可以随时查看并复制。

首次创建应用时，`Client Secret` 是空的，需要点击 `Generate a new client secret` 按钮生成。

`Client Secret` 只能查看一次，如果忘记了可以点击 `Generate a new client secret` 按钮重新生成。

<img width="350px" alt="oauth2-github-client" src="/img/oauth2/oauth2-github-client.jpg"/>

## 填写配置
前往synctv管理后台oauth2配置页并找到Github配置项

<img width="350px"
alt="oauth2-github-config"
src="/img/oauth2/oauth2-github-config.jpg"
/>

点击启用

将`Client ID` 和`Client Secret`填写完整

`Redirect Url` 无需填写，因为Github仅支持一个回调地址