@echo off
chcp 65001 >nul
echo ====================================
echo    推送修复到 GitHub
echo ====================================
echo.
echo 正在推送修复...
echo.

git push

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ====================================
    echo ✅ 推送成功！
    echo ====================================
    echo.
    echo Vercel会自动检测到更新并重新部署
    echo 大约30-60秒后，你的网站就会更新
    echo.
    echo 网站地址: https://techdaily-auto.vercel.app
    echo.
    echo 刷新页面查看修复效果！
    echo.
) else (
    echo.
    echo ====================================
    echo ❌ 推送失败
    echo ====================================
    echo.
    echo 请使用 GitHub Desktop:
    echo 1. 打开 GitHub Desktop
    echo 2. 点击 "Push origin" 或 "Sync" 按钮
    echo 3. 等待推送完成
    echo.
)

pause
