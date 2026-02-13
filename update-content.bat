@echo off
chcp 65001 >nul
echo ====================================
echo    更新内容
echo ====================================
echo.
echo 正在抓取最新内容...
python scraper.py
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ 更新成功！
    echo.
    echo 数据已保存到 public/data.json
    echo 如果开发服务器正在运行，刷新页面即可看到更新
) else (
    echo.
    echo ❌ 更新失败，请检查网络连接
)
echo.
pause
