@echo off
chcp 65001 >nul
echo ====================================
echo    推送代码到 GitHub
echo ====================================
echo.
echo 仓库地址: https://github.com/theosunny/techdaily-auto
echo.
echo 正在推送代码...
echo.

git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ====================================
    echo ✅ 推送成功！
    echo ====================================
    echo.
    echo 下一步：在Vercel部署
    echo.
    echo 1. 访问: https://vercel.com/new
    echo 2. 点击 "Import Git Repository"
    echo 3. 选择 "theosunny/techdaily-auto"
    echo 4. 点击 "Deploy"
    echo 5. 等待30秒，完成！
    echo.
) else (
    echo.
    echo ====================================
    echo ❌ 推送失败
    echo ====================================
    echo.
    echo 可能的原因：
    echo 1. 需要GitHub登录认证
    echo 2. 网络连接问题
    echo.
    echo 请按照以下步骤操作：
    echo.
    echo 方法1: 使用GitHub Desktop ^(推荐^)
    echo   - 下载: https://desktop.github.com
    echo   - 打开软件并登录
    echo   - File ^> Add Local Repository
    echo   - 选择当前文件夹
    echo   - 点击 "Publish repository"
    echo.
    echo 方法2: 手动推送
    echo   - 访问: https://github.com/settings/tokens
    echo   - 生成一个新的 Personal Access Token
    echo   - 再次运行本脚本，使用token作为密码
    echo.
)

pause
