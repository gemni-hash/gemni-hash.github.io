# 小小放映厅

这是一个纯前端、静态可部署的 Bilibili 儿童白名单播放器。

番剧 `ss...` / `ep...` 自动导入现在通过单独的 Cloudflare Worker 代理完成，这样部署到 GitHub Pages 后也能稳定工作。

## 部署到 iPad 主屏幕

1. 把整个 `bilibili-kids-whitelist` 目录部署到 HTTPS 静态站。
2. 入口文件是 `index.html`，不需要构建。
3. 用 iPad Safari 打开部署后的网址。
4. 点击分享按钮，选择“添加到主屏幕”。

## 部署番剧代理

1. 进入 `cloudflare-worker` 目录。
2. 用 Cloudflare 账号登录 Wrangler：`npx wrangler login`
3. 发布 Worker：`npx wrangler deploy`
4. 记下发布后的地址，例如 `https://bilibili-kids-bangumi-proxy.<subdomain>.workers.dev`
5. 打开 `index.html`，把脚本顶部的 `const BANGUMI_PROXY_BASE = "";` 改成你的 Worker 地址。
6. 重新部署 GitHub Pages 静态站。

Worker 只代理番剧元数据，不代理播放器页面或视频流。

## 已包含的 PWA 文件

- `manifest.webmanifest`
- `service-worker.js`
- `icon.svg`
- `apple-touch-icon.svg`
- `cloudflare-worker/src/index.js`
- `cloudflare-worker/wrangler.toml`

## 说明

- 自动抓标题和封面会尝试读取公开的 Bilibili 视频元数据接口。
- 合集自动导入支持普通 BV 多 P 视频，也支持 `ss...`、`ep...` 和完整番剧链接。
- 番剧自动导入依赖 `BANGUMI_PROXY_BASE` 指向已部署的 Cloudflare Worker；如果没填，设置页会明确提示，但 BV 导入仍然可用。
- 首次访问如果没有网络，离线壳仍可打开，但自动抓取和播放器本身仍需要联网。
