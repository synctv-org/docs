## 什么是OAuth2
OAuth2是一个开放标准，允许用户授权第三方应用访问他们存储在另外的服务提供者上的信息，而不需要将用户名和密码提供给第三方应用或分享他们数据的所有内容。更多信息请参考[OAuth2](https://oauth.net/2/)。

在本项目中用于用户登录，用户可以使用第三方账号登录，无需注册新账号。

## OAuth2 的关键参数
### Client ID
客户端ID是在申请应用时由服务端生成的，该值是公开的。

### Client Secret
客户端密钥是在申请应用时由服务端生成的，该值是保密的，不得泄露给第三方。

### Callback URL
回调地址是在用户授权后，服务端跳转回客户端的地址。回调地址是在申请应用时填写的，一般是客户端的一个页面地址，用于接收服务端的授权结果。

在 `SyncTV` 中，回调地址是 `https://<your-domain>/web/oauth2/callback/<oauth2-providor>`

比如 `Github` 的回调地址是 `https://<your-domain>/web/oauth2/callback/github`

> 如果你是开发者，可以使用 `http://localhost:8080/oauth2/callback/github` 作为回调地址，此地址不依赖前端页面。
> 
> 登录地址则为 `http://localhost:8080/oauth2/login/github`