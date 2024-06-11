# Nginx
在网站配置文件的 `server` 字段中添加

```nginx
client_max_body_size 20m;
proxy_cache off;
proxy_buffering off;
proxy_http_version 1.1;

proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto $scheme;
proxy_set_header X-Forwarded-Protocol $scheme;
proxy_set_header X-Forwarded-Host $http_host;
proxy_set_header REMOTE-HOST $remote_addr;
proxy_set_header Upgrade $http_upgrade;

location = /api/room/ws {
    proxy_pass http://127.0.0.1:8080;
    proxy_set_header Host $host;
    proxy_set_header Connection "upgrade";
}

location / {
    proxy_pass http://127.0.0.1:8080;
    proxy_set_header Host $host;
    proxy_set_header Connection "";
    proxy_set_header Range $http_range;
}
```