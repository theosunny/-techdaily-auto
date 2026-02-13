@echo off
chcp 65001 >nul
echo ====================================
echo    部署到 Vercel
echo ====================================
echo.
echo 正在部署，请稍候...
echo.
npx vercel --prod
echo.
echo ====================================
echo 🎉 部署完成！
echo ====================================
echo.
echo 你的网站地址会显示在上面
echo 复制它并在浏览器中打开查看效果！
echo.
pause
