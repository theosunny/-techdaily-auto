@echo off
chcp 65001 >nul
echo ====================================
echo    启动开发服务器
echo ====================================
echo.
echo 正在启动... 请稍候
echo 浏览器将自动打开 http://localhost:3000
echo.
echo 按 Ctrl+C 停止服务器
echo.
start http://localhost:3000
call npm run dev
