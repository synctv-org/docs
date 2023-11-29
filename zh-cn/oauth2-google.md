# Google
## `注意！！⚠️Google不允许使用ip地址作为回调，使用需要域名解析ip使用`
## 注册应用
前往Goole [云端平台](https://console.cloud.google.com/projectselector2/apis/dashboard?project=_&supportedpurview=project)。
登录账号

<img width="350px" alt="oauth2-google-mkdir" src="/img/oauth2/oauth2-google-mkdir.jpg"/>


* 点击 `选择项目`
* 选择右上角 `新建项目` 创建项目
* 创建完毕后点击边栏中的 `OAuth consent screen` 选择创建，将标`*`的必填项填写完整,然后一路创建即可

* 点击边栏中的`凭证`
* 选择`创建凭证`选择`OAuth客户端ID`
* 选择`web应用`
* 填写`已获授权的重定向 URI`，格式为`https://<your-domain>/web/oauth2/callback/google`

<img width="350px" alt="oauth2-google-ID" src="/img/oauth2/oauth2-google-ID.jgp"/>

完成后会弹出

<img width="350px" alt="oauth2-google" src="/img/oauth2/oauth2-google.jpg"/>

其中 
`客户端ID` 为 `Client ID`
`客户端密钥` 为 `Client Secret`
可随时查看，并不会隐藏
## 填写配置
前往synctv管理后台oauth2配置页并找到Google配置项

<img width="350px"
alt="oauth2-google-config"
src="/img/oauth2/oauth2-google-config.jpg"
/>

将`Client ID` 和`Client Secret`填写完整

`Redirect url`则填写回调地址

- `点击启用`