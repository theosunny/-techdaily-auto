@echo off
chcp 65001 >nul
echo ====================================
echo    推送Vercel修复到GitHub
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
    echo.
    echo 下一步：
    echo 1. 访问 https://vercel.com/dashboard
    echo 2. 查看你的项目
    echo 3. 等待自动部署完成（约1-2分钟）
    echo 4. 部署成功后访问你的网站
    echo.
    echo 或者直接在Vercel项目页面点击 "Redeploy"
    echo.
) else (
    echo.
    echo ====================================
    echo ❌ 推送失败
    echo ====================================
    echo.
    echo 请使用 GitHub Desktop:
    echo 1. 打开 GitHub Desktop
    echo 2. 点击 "Push origin" 按钮
    echo 3. 等待推送完成
    echo.
)

pause
