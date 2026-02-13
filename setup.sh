#!/bin/bash

# TechDaily 自动化赚钱系统 - 快速安装脚本 (Linux/Mac)

echo "===================================="
echo "   TechDaily 自动化赚钱系统"
echo "===================================="
echo ""

echo "[1/4] 检查环境..."
if ! command -v python3 &> /dev/null; then
    echo "❌ 未找到Python，请先安装Python 3.8+"
    exit 1
fi

if ! command -v node &> /dev/null; then
    echo "❌ 未找到Node.js，请先安装Node.js"
    exit 1
fi

echo "✅ 环境检查通过"
echo ""

echo "[2/4] 安装Python依赖..."
pip3 install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "❌ Python依赖安装失败"
    exit 1
fi
echo "✅ Python依赖安装完成"
echo ""

echo "[3/4] 安装Node.js依赖..."
npm install
if [ $? -ne 0 ]; then
    echo "❌ Node.js依赖安装失败"
    exit 1
fi
echo "✅ Node.js依赖安装完成"
echo ""

echo "[4/4] 抓取初始数据..."
python3 scraper.py
if [ $? -ne 0 ]; then
    echo "❌ 数据抓取失败"
    exit 1
fi
echo "✅ 数据抓取完成"
echo ""

echo "===================================="
echo "🎉 安装完成！"
echo "===================================="
echo ""
echo "下一步:"
echo "1. 运行 ./start-dev.sh 启动开发服务器"
echo "2. 浏览器打开 http://localhost:3000"
echo "3. 查看效果后，按照 README.md 部署到Vercel"
echo ""
