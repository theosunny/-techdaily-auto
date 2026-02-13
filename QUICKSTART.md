# 🚀 快速启动指南

## 立即开始 (3分钟)

### Windows用户

```cmd
# 1. 双击运行安装脚本
setup.bat

# 2. 启动开发服务器
start-dev.bat

# 浏览器会自动打开 http://localhost:3000
```

### Mac/Linux用户

```bash
# 1. 赋予执行权限并运行安装
chmod +x setup.sh start-dev.sh
./setup.sh

# 2. 启动开发服务器
./start-dev.sh

# 浏览器打开 http://localhost:3000
```

## 部署到Vercel (5分钟)

### 方法1: GitHub + Vercel (推荐)

1. **初始化Git仓库**
   ```bash
   git init
   git add .
   git commit -m "初始提交: TechDaily自动化赚钱系统"
   ```

2. **推送到GitHub**
   ```bash
   # 在GitHub创建新仓库，然后:
   git remote add origin https://github.com/你的用户名/techdaily.git
   git branch -M main
   git push -u origin main
   ```

3. **在Vercel部署**
   - 访问 https://vercel.com
   - 点击 "New Project"
   - 导入你的GitHub仓库
   - 点击 "Deploy"
   - 等待30秒，完成！

4. **配置自动更新**
   - 在GitHub仓库 Settings → Actions → General
   - 开启 "Read and write permissions"
   - 进入 Actions 标签，手动运行一次 workflow

### 方法2: Vercel CLI

```bash
# 安装Vercel CLI
npm i -g vercel

# 登录
vercel login

# 部署
vercel --prod

# 完成！会显示你的网站地址
```

## 接入Google AdSense

### 第一步: 申请AdSense

1. 访问 https://www.google.com/adsense
2. 注册账号
3. 添加你的网站URL (Vercel给的域名)
4. 等待1-2周审核

### 第二步: 获取广告代码

1. 登录AdSense后台
2. 创建广告单元
3. 选择"自适应广告"
4. 复制广告代码

### 第三步: 添加到网站

编辑 `pages/index.js`:

```javascript
// 找到第52行左右，替换为你的AdSense代码
<div className="ad-banner">
  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-XXXXXXX"
     crossorigin="anonymous"></script>
  <ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-XXXXXXX"
     data-ad-slot="XXXXXXX"
     data-ad-format="auto"></ins>
  <script>
     (adsbygoogle = window.adsbygoogle || []).push({});
  </script>
</div>
```

### 第四步: 重新部署

```bash
git add .
git commit -m "添加AdSense广告"
git push

# Vercel会自动重新部署
```

## 常见问题

### Q: 多久能开始赚钱？

A:
- **第1周**: 基本没收入 (需要Google审核)
- **第1个月**: $0.1-1/天 (开始有少量流量)
- **第3个月**: $2-10/天 (SEO开始生效)
- **第6个月**: $10-50+/天 (流量稳定增长)

### Q: 如何提高收益？

1. **添加更多RSS源**: 编辑 `config.json`
2. **SEO优化**:
   - 添加sitemap.xml
   - 优化meta标签
   - 提交到Google Search Console
3. **社交推广**:
   - 分享到Twitter/微博
   - 投稿到Product Hunt
   - 加入科技社区
4. **多站点策略**: 复制这个项目，做多个垂直领域

### Q: 广告不显示怎么办？

1. 确认AdSense已审核通过
2. 检查广告代码是否正确
3. 清除浏览器缓存
4. 等待24-48小时 (AdSense需要时间)
5. 检查是否有AdBlock插件

### Q: 如何更换RSS源？

编辑 `config.json`:

```json
{
  "rss_feeds": [
    {
      "name": "你的RSS源",
      "url": "https://example.com/feed",
      "category": "分类"
    }
  ]
}
```

然后运行:
```bash
python scraper.py
git add .
git commit -m "更新RSS源"
git push
```

### Q: 如何修改更新频率？

编辑 `.github/workflows/update.yml`:

```yaml
schedule:
  - cron: '0 */1 * * *'  # 每小时
  # 或
  - cron: '0 0 * * *'    # 每天
```

## 进阶优化

### 1. 添加自己的域名

1. 在域名服务商添加CNAME记录:
   ```
   www CNAME your-project.vercel.app
   ```

2. 在Vercel项目设置添加域名

3. 更新 `config.json` 中的 `domain`

### 2. 添加Google Analytics

在 `pages/index.js` 的 `<Head>` 标签添加:

```html
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXX');
</script>
```

### 3. 性能优化

- 启用CDN (Vercel自带)
- 压缩图片
- 添加缓存策略

### 4. 扩展功能

- 添加评论系统 (Disqus)
- 添加邮件订阅 (Mailchimp)
- 添加搜索功能
- 添加深色模式

## 监控收益

### 每日检查清单

- [ ] AdSense收益
- [ ] Google Analytics流量
- [ ] Search Console排名
- [ ] 网站是否正常运行
- [ ] 自动更新是否工作

### 推荐工具

- **收益**: Google AdSense
- **流量**: Google Analytics
- **SEO**: Google Search Console
- **监控**: UptimeRobot (免费监控网站状态)

## 支持

- 查看完整文档: `README.md`
- 遇到问题: 查看GitHub Issues
- 需要帮助: 联系开发者

---

**祝你赚钱顺利! 💰**
