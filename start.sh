#!/bin/bash
# 小天才影院 - 本地启动脚本
# Bilibili 嵌入播放器需要 HTTP 协议，不能直接双击 HTML 文件打开

PORT=8080
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "🎬 启动小天才影院..."
echo "📂 目录: $DIR"
echo "🌐 地址: http://localhost:$PORT"
echo ""
echo "按 Ctrl+C 停止服务"
echo ""

# 自动打开浏览器（延迟1秒等服务器启动）
(sleep 1 && open "http://localhost:$PORT") &

cd "$DIR"
python3 -m http.server $PORT
