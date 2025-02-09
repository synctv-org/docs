## 什么是P2P

P2P（Peer-to-Peer）是一种网络架构，其中每个节点既是客户端又是服务器。在P2P网络中，节点之间直接连接，共享资源，如文件、计算能力等，而不依赖于中心化的服务器。

## 为什么需要P2P

SyncTV 当有多个用户观看同一个视频时，服务器需要承受很大的网络压力。这时，P2P就可以派上用场了。

## 如何使用P2P

SyncTV 借助 [CDNBye](https://www.cdnbye.com/cn/) 提供的 P2P 服务，可以轻易实现视频的 P2P 传输。

只需要在 [CDNBye 面板](https://dash.cdnbye.com/#/signup?zone=p3&inviter=pyh1670605849%40gmail.com) 注册一个账号，如果你的域名备案过那么可以使用国内的区域，否则使用国外的区域，比如 `hk` ，然后添加你的域名即可。

<img width="350px" alt="p2p-cdnbye" src="/img/p2p/swarmcloud.png"/>

然后前往 SyncTV 的 `管理后台` 页面中的 `系统设置`，修改 `Swarm Cloud 区域` 为对应的区域，比如 `hk` 即可。

<img width="350px" alt="p2p-cdnbye" src="/img/p2p/zone.png"/>

[区域选择](https://www.cdnbye.com/cn/tracker.html)：

- 广州：`cn`
- 香港：`hk`
- 美国：`us`
- 欧洲: `eu`