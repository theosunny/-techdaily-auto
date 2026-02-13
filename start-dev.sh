#!/bin/bash

echo "===================================="
echo "   启动开发服务器"
echo "===================================="
echo ""
echo "正在启动... 请稍候"
echo "浏览器打开 http://localhost:3000"
echo ""
echo "按 Ctrl+C 停止服务器"
echo ""

# 在Mac上自动打开浏览器
if [[ "$OSTYPE" == "darwin"* ]]; then
    open http://localhost:3000
fi

npm run dev
