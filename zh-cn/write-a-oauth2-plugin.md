## 原理
- 使用 `github.com/hashicorp/go-plugin` 实现插件
- 插件需要实现 `provider.Provider` 接口
- 主进程与插件之间通过 `gRPC` 通信

## 编写 Oauth2 插件
[示例源码](https://github.com/synctv-org/synctv/tree/main/internal/provider/plugins)

## 插件的安装参考
- 将插件编译成二进制文件
- 在 [配置文件](#/zh-cn/configuration?id=plugins) 中添加插件配置