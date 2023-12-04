# Microsoft
## 注册应用

**`注意⚠️!!Microsoft回调地址填写需要配置https`**
**`本机调试可使用http://localhost:<port>` **

前往Microsoft [云端平台](https://portal.azure.com/#view/Microsoft_AAD_RegisteredApps/CreateApplicationBlade/quickStartType~/null/isMSAApp~/false)。
登录账号

<img width="350px" alt="oauth2-microsoft-mkdir" src="/img/oauth2/oauth2-microsoft-mkdir.jpg"/>


* 将相关的配置填写完毕
* 重定向地址填写示例 `https://<your-domain>/web/oauth2/callback/microsoft`
* 点击注册

前往[应用列表](https://portal.azure.com/#view/Microsoft_AAD_RegisteredApps/ApplicationsListBlade)查看应用

应用配置页

<img width="350px" alt="oauth2-microsoft-ID" src="/img/oauth2/oauth2-microsoft-ID.jpg"/>

* 选择证书和密码
* 新建客户端密码
* 填写说明并设置有效时间
* 将`值`记录

<img width="350px"
alt="oauth2-microsoft-config"
src="/img/oauth2/oauth2-microsoft-info.jpg"
/>

回到应用配置页

其中 
`应用程序(客户端) ID` 为 `Client ID`
`客户端密码的值` 为 `Client Secret`
可随时查看，并不会隐藏
## 填写配置
前往synctv管理后台oauth2配置页并找到Microsoft配置项

<img width="350px"
alt="oauth2-microsoft-config"
src="/img/oauth2/oauth2-microsoft-config.jpg"
/>

将`Client ID` 和`Client Secret`填写完整

`Redirect url`则填写回调地址

- `点击启用`