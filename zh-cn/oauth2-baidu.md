# 百度及百度网盘
## 注册应用
前往百度网盘的 [OAuth应用注册地址](https://pan.baidu.com/union/apply)。

按平台相关要求进行认证

认证完毕后点击 `创建` 按钮。

- `应用类型`选择软件

<img width="350px" alt="oauth2-baidu-new" src="/img/oauth2/oauth2-baidu-new.jpg"/>

## 获取 Client ID 和 Client Secret
创建成功后，会有相关的信息显示，与Gitee一样，百度的相关信息参数也随时可查

- `APPID` 为Client ID
- `APPkey` 为Client Secret


<img width="350px" alt="oauth2-baidu-info" src="/img/oauth2/oauth2-baidu-info.jpg"/>

前往应用的安全设置处设置回调地址

回调地址示例为 `https://<your-domain>/web/oauth2/callback/baidu`

<img width="350px"
alt="oauth2-baidu-config-oauth2"
src="/img/oauth2/oauth2-baidu-config-oauth2.jpg"
/>

## 填写配置
前往synctv管理后台oauth2配置页并找到百度或百度网盘配置项

<img width="350px"
alt="oauth2-baidu-config"
src="/img/oauth2/oauth2-baidu-config.jpg"
/>

将`Client ID` 和`Client Secret`填写完整

`Redirect url`则填写回调地址

- `点击启用`