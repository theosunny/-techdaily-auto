@echo off
chcp 65001 >nul
echo ====================================
echo    TechDaily 自动化赚钱系统
echo ====================================
echo.

echo [1/4] 检查环境...
where python >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ 未找到Python，请先安装Python 3.8+
    pause
    exit /b 1
)

where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ 未找到Node.js，请先安装Node.js
    pause
    exit /b 1
)

echo ✅ 环境检查通过
echo.

echo [2/4] 安装Python依赖...
pip install -r requirements.txt
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Python依赖安装失败
    pause
    exit /b 1
)
echo ✅ Python依赖安装完成
echo.

echo [3/4] 安装Node.js依赖...
call npm install
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Node.js依赖安装失败
    pause
    exit /b 1
)
echo ✅ Node.js依赖安装完成
echo.

echo [4/4] 抓取初始数据...
python scraper.py
if %ERRORLEVEL% NEQ 0 (
    echo ❌ 数据抓取失败
    pause
    exit /b 1
)
echo ✅ 数据抓取完成
echo.

echo ====================================
echo 🎉 安装完成！
echo ====================================
echo.
echo 下一步:
echo 1. 运行 start-dev.bat 启动开发服务器
echo 2. 浏览器打开 http://localhost:3000
echo 3. 查看效果后，按照 README.md 部署到Vercel
echo.
pause
