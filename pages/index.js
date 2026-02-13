import Head from 'next/head';
import { useEffect, useState } from 'react';
import Script from 'next/script';

export default function Home() {
  const [data, setData] = useState(null);
  const [selectedCategory, setSelectedCategory] = useState('全部');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // 加载数据
    fetch('/data.json')
      .then(res => res.json())
      .then(data => {
        setData(data);
        setLoading(false);
      })
      .catch(err => {
        console.error('加载数据失败:', err);
        setLoading(false);
      });
  }, []);

  // 加载AdSense广告
  useEffect(() => {
    if (typeof window !== 'undefined') {
      try {
        (window.adsbygoogle = window.adsbygoogle || []).push({});
      } catch (err) {
        console.log('AdSense error:', err);
      }
    }
  }, [data]);

  // 获取所有分类
  const categories = data ? ['全部', ...new Set(data.articles.map(a => a.category))] : ['全部'];

  // 过滤文章
  const filteredArticles = data?.articles.filter(article =>
    selectedCategory === '全部' || article.category === selectedCategory
  ) || [];

  return (
    <>
      <Head>
        <title>TechDaily - 每日科技资讯自动聚合</title>
        <meta name="description" content="自动聚合全球最新科技新闻、AI动态、编程技术文章" />
        <meta name="keywords" content="科技资讯,AI,编程,开源,技术博客" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      {/* Google AdSense Script - 使用测试发布商ID */}
      <Script
        async
        src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3940256099942544"
        crossOrigin="anonymous"
        strategy="afterInteractive"
      />

      <div className="container">
        {/* 头部 */}
        <header className="header">
          <h1>🚀 TechDaily</h1>
          <p>每日自动聚合全球科技资讯</p>
          {data && (
            <div className="update-time">
              最后更新: {new Date(data.last_updated).toLocaleString('zh-CN')}
            </div>
          )}
        </header>

        {/* Google AdSense 横幅广告位 */}
        <div className="ad-banner">
          <ins className="adsbygoogle"
               style={{display: 'block'}}
               data-ad-client="ca-pub-3940256099942544"
               data-ad-slot="6300978111"
               data-ad-format="auto"
               data-full-width-responsive="true"></ins>
        </div>

        {/* 分类过滤 */}
        <div className="category-filter">
          {categories.map(cat => (
            <button
              key={cat}
              className={selectedCategory === cat ? 'active' : ''}
              onClick={() => setSelectedCategory(cat)}
            >
              {cat}
            </button>
          ))}
        </div>

        {/* 文章列表 */}
        <main className="articles">
          {loading ? (
            <div className="loading">加载中...</div>
          ) : (
            <>
              <div className="articles-count">
                共 {filteredArticles.length} 篇文章
              </div>

              {filteredArticles.map((article, index) => (
                <article key={article.id} className="article-card">
                  <div className="article-header">
                    <span className="category-tag">{article.category}</span>
                    <span className="source">{article.source}</span>
                  </div>
                  <h2>
                    <a href={article.link} target="_blank" rel="noopener noreferrer">
                      {article.title}
                    </a>
                  </h2>
                  <p className="description">{article.description}</p>
                  <div className="article-footer">
                    <span className="published">{article.published}</span>
                  </div>

                  {/* 每5篇文章插入一个广告 */}
                  {(index + 1) % 5 === 0 && (
                    <div className="ad-inline">
                      <ins className="adsbygoogle"
                           style={{display: 'block'}}
                           data-ad-client="ca-pub-3940256099942544"
                           data-ad-slot="6300978111"
                           data-ad-format="auto"
                           data-full-width-responsive="true"></ins>
                    </div>
                  )}
                </article>
              ))}
            </>
          )}
        </main>

        {/* 页脚 */}
        <footer className="footer">
          <p>© 2026 TechDaily | 自动聚合科技资讯 | 每2小时自动更新</p>
          <p>本站内容来自互联网公开RSS源，版权归原作者所有</p>
        </footer>
      </div>

      <style jsx>{`
        .container {
          max-width: 1200px;
          margin: 0 auto;
          padding: 20px;
          font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Microsoft YaHei', sans-serif;
        }

        .header {
          text-align: center;
          padding: 40px 0;
          border-bottom: 2px solid #eee;
        }

        .header h1 {
          font-size: 48px;
          margin: 0;
          color: #333;
        }

        .header p {
          font-size: 18px;
          color: #666;
          margin: 10px 0;
        }

        .update-time {
          font-size: 14px;
          color: #999;
          margin-top: 10px;
        }

        .ad-banner {
          margin: 30px 0;
          min-height: 100px;
        }

        .category-filter {
          display: flex;
          gap: 10px;
          flex-wrap: wrap;
          margin: 30px 0;
          padding: 20px;
          background: #f9f9f9;
          border-radius: 8px;
        }

        .category-filter button {
          padding: 8px 16px;
          border: 1px solid #ddd;
          background: white;
          border-radius: 20px;
          cursor: pointer;
          transition: all 0.3s;
          font-size: 14px;
        }

        .category-filter button:hover {
          background: #f0f0f0;
        }

        .category-filter button.active {
          background: #0070f3;
          color: white;
          border-color: #0070f3;
        }

        .articles-count {
          margin: 20px 0;
          color: #666;
          font-size: 14px;
        }

        .articles {
          margin: 20px 0;
        }

        .loading {
          text-align: center;
          padding: 100px 0;
          font-size: 18px;
          color: #999;
        }

        .article-card {
          background: white;
          border: 1px solid #eee;
          border-radius: 8px;
          padding: 24px;
          margin-bottom: 20px;
          transition: box-shadow 0.3s;
        }

        .article-card:hover {
          box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .article-header {
          display: flex;
          gap: 10px;
          align-items: center;
          margin-bottom: 12px;
        }

        .category-tag {
          background: #0070f3;
          color: white;
          padding: 4px 12px;
          border-radius: 12px;
          font-size: 12px;
        }

        .source {
          color: #666;
          font-size: 14px;
        }

        .article-card h2 {
          margin: 0 0 12px 0;
          font-size: 20px;
          line-height: 1.4;
        }

        .article-card h2 a {
          color: #333;
          text-decoration: none;
        }

        .article-card h2 a:hover {
          color: #0070f3;
        }

        .description {
          color: #666;
          line-height: 1.6;
          margin: 12px 0;
        }

        .article-footer {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-top: 12px;
          padding-top: 12px;
          border-top: 1px solid #eee;
        }

        .published {
          font-size: 13px;
          color: #999;
        }

        .ad-inline {
          margin: 30px 0;
          min-height: 100px;
        }

        .footer {
          text-align: center;
          padding: 40px 0;
          border-top: 2px solid #eee;
          margin-top: 60px;
          color: #999;
          font-size: 14px;
        }

        .footer p {
          margin: 8px 0;
        }

        @media (max-width: 768px) {
          .container {
            padding: 10px;
          }

          .header h1 {
            font-size: 32px;
          }

          .category-filter {
            padding: 15px;
          }

          .article-card {
            padding: 16px;
          }
        }
      `}</style>
    </>
  );
}
