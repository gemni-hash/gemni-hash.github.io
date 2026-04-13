# 小小放映厅

这是一个纯前端、静态可部署的 Bilibili 儿童白名单播放器。

## 部署到 iPad 主屏幕

1. 把整个 `bilibili-kids-whitelist` 目录部署到 HTTPS 静态站。
2. 入口文件是 `index.html`，不需要构建。
3. 用 iPad Safari 打开部署后的网址。
4. 点击分享按钮，选择“添加到主屏幕”。

## 已包含的 PWA 文件

- `manifest.webmanifest`
- `service-worker.js`
- `icon.svg`
- `apple-touch-icon.svg`

## 说明

- 自动抓标题和封面会尝试读取公开的 Bilibili 视频元数据接口。
- 合集自动导入支持普通 BV 多 P 视频，也支持 `ss...`、`ep...` 和完整番剧链接。
- 首次访问如果没有网络，离线壳仍可打开，但自动抓取和播放器本身仍需要联网。
