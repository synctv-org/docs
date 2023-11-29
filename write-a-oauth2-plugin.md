## Principle
- Use `github.com/hashicorp/go-plugin` to implement the plugin
- plugins need to implement the `provider.Provider` interface
- Communication between the main process and the plugin is through `gRPC`

## Write Oauth2 plugin
[Example source code](https://github.com/synctv-org/synctv/tree/main/internal/provider/plugins)

## Plugin installation reference
- Compile plugins into binaries
- Add plugin configuration in [Configuration File](#/zh-cn/configuration?id=plugins)