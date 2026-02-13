# 🚀 TechDaily - 自动化科技资讯聚合网站

**每天自动赚钱的闭环系统** - 自动抓取科技资讯 → 生成网站 → 获取流量 → 广告变现

## 💰 盈利模式

1. **自动内容聚合**: 每2小时自动抓取全球科技资讯
2. **SEO优化**: 自动生成搜索引擎友好的页面
3. **流量变现**: 通过Google AdSense等广告平台赚钱
4. **零成本运行**: 使用免费的Vercel托管和GitHub Actions

**预期收益**:
- 初期 (1-3个月): 每天0.5-2元 (需要积累流量)
- 中期 (3-6个月): 每天5-20元 (SEO开始生效)
- 后期 (6个月+): 每天20-100元+ (取决于流量和优化)

## ✨ 功能特性

- ✅ 自动抓取7个科技RSS源 (36氪、InfoQ、机器之心、Hacker News等)
- ✅ 精美的响应式网站设计
- ✅ 按分类过滤文章
- ✅ 每2小时自动更新内容
- ✅ 广告位预留 (Google AdSense)
- ✅ SEO优化
- ✅ 完全免费部署

## 📦 技术栈

- **前端**: Next.js + React (静态导出)
- **后端**: Python (RSS抓取)
- **部署**: Vercel (免费)
- **自动化**: GitHub Actions (免费)

## 🚀 快速部署 (5分钟)

### 步骤1: 准备环境

确保你已安装:
- Node.js (v18+)
- Python 3.8+
- Git

### 步骤2: 安装依赖

```bash
# 安装Node.js依赖
npm install

# 安装Python依赖
pip install -r requirements.txt
```

### 步骤3: 测试抓取数据

```bash
# 运行抓取脚本
python scraper.py

# 检查是否生成了 public/data.json
```

### 步骤4: 本地运行测试

```bash
# 启动开发服务器
npm run dev

# 浏览器打开 http://localhost:3000
```

### 步骤5: 部署到Vercel

#### 方法1: 一键部署 (推荐)

1. **Fork本项目到你的GitHub**

2. **登录Vercel**: https://vercel.com

3. **导入项目**:
   - 点击 "New Project"
   - 选择你fork的仓库
   - 点击 "Deploy"

4. **完成!** 你的网站会自动部署到 `https://your-project.vercel.app`

#### 方法2: CLI部署

```bash
# 安装Vercel CLI
npm i -g vercel

# 登录
vercel login

# 部署
vercel --prod
```

### 步骤6: 配置自动更新

1. **在GitHub仓库设置中**:
   - 进入 `Settings` → `Actions` → `General`
   - 开启 "Allow all actions and reusable workflows"
   - 开启 "Read and write permissions"

2. **测试GitHub Actions**:
   - 进入 `Actions` 标签
   - 手动运行 "自动更新科技资讯" workflow

3. **每2小时自动运行**:
   - GitHub Actions会自动运行，无需手动操作
   - 每次运行会更新 `public/data.json`
   - Vercel会自动检测到更新并重新部署

## 💵 接入广告赚钱

### Google AdSense (推荐)

1. **申请AdSense**:
   - 访问 https://www.google.com/adsense
   - 注册账号并提交网站审核
   - 通常需要1-2周审核

2. **获取广告代码**:
   - 登录AdSense控制台
   - 创建广告单元
   - 复制广告代码

3. **添加到网站**:
   打开 `pages/index.js`，找到这两处并替换:

   ```javascript
   // 第一处: 横幅广告 (第52行)
   <div className="ad-banner">
     {/* 粘贴你的AdSense代码 */}
   </div>

   // 第二处: 文章间广告 (第103行)
   <div className="ad-inline">
     {/* 粘贴你的AdSense代码 */}
   </div>
   ```

4. **重新部署**:
   ```bash
   git add .
   git commit -m "添加AdSense广告"
   git push
   ```

### 其他广告平台

- **百度联盟**: https://union.baidu.com (中文流量)
- **搜狗联盟**: https://union.sogou.com
- **360联盟**: https://union.360.cn

## 📈 提升收益的技巧

### 1. SEO优化

- **自定义标题**: 修改 `config.json` 中的 `site.title`
- **添加关键词**: 在文章页面添加更多meta标签
- **生成sitemap**: 添加 `sitemap.xml`

### 2. 增加RSS源

编辑 `config.json`，添加更多RSS源:

```json
{
  "rss_feeds": [
    {
      "name": "你的RSS源名称",
      "url": "https://example.com/feed",
      "category": "分类名"
    }
  ]
}
```

### 3. 社交媒体推广

- 自动发布到Twitter/微博
- 加入科技社区分享
- 投稿到导航站 (如Product Hunt、少数派)

### 4. 扩展功能

- 添加评论系统 (Disqus/Gitalk)
- 添加搜索功能
- 添加邮件订阅
- 添加深色模式

### 5. 多站点策略

复制这个项目，做多个垂直领域的站点:
- 金融资讯站
- AI资讯站
- 开源项目日报
- 创业资讯站

## 🔧 自定义配置

### 修改网站信息

编辑 `config.json`:

```json
{
  "site": {
    "title": "你的网站名称",
    "description": "你的网站描述",
    "domain": "https://your-domain.com"
  }
}
```

### 修改更新频率

编辑 `.github/workflows/update.yml`:

```yaml
schedule:
  - cron: '0 */2 * * *'  # 每2小时
  # 改为每小时: '0 * * * *'
  # 改为每天: '0 0 * * *'
```

### 添加自己的域名

1. 在Vercel项目设置中添加域名
2. 在域名DNS设置中添加CNAME记录
3. 等待生效

## 📊 监控和分析

### Google Analytics

1. 创建GA账号: https://analytics.google.com
2. 获取跟踪ID
3. 添加到 `pages/index.js` 的 `<Head>` 标签中

### 收益监控

- **AdSense报告**: 每日查看收益
- **Google Search Console**: 监控SEO表现
- **Vercel Analytics**: 查看流量统计

## 🛠️ 故障排查

### 抓取失败

```bash
# 检查网络连接
ping 36kr.com

# 手动测试RSS源
curl https://36kr.com/feed

# 查看错误日志
python scraper.py
```

### 部署失败

```bash
# 检查Next.js配置
npm run build

# 查看Vercel日志
vercel logs
```

### 广告不显示

1. 检查AdSense是否审核通过
2. 检查广告代码是否正确
3. 清除浏览器缓存
4. 等待24小时 (AdSense需要时间生效)

## 📝 项目结构

```
makemoney/
├── .github/
│   └── workflows/
│       └── update.yml          # GitHub Actions自动化
├── pages/
│   └── index.js                # 首页
├── public/
│   └── data.json               # 抓取的数据
├── config.json                 # RSS源配置
├── scraper.py                  # Python抓取脚本
├── requirements.txt            # Python依赖
├── package.json                # Node.js依赖
├── next.config.js              # Next.js配置
├── vercel.json                 # Vercel配置
└── README.md                   # 说明文档
```

## 🤝 贡献

欢迎提交Issue和Pull Request!

## 📄 许可证

MIT License - 自由使用和修改

## ⚠️ 免责声明

- 本项目仅供学习和研究使用
- 请遵守各RSS源的使用条款
- 广告收益不保证，取决于流量和市场
- 请遵守相关法律法规

## 💬 联系方式

- GitHub Issues: https://github.com/yourusername/techdaily/issues
- 邮件: your@email.com

---

**祝你赚钱顺利! 🎉**

如果这个项目对你有帮助，请给个Star ⭐️
