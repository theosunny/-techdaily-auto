#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
自动RSS抓取脚本 - 每天抓取科技资讯并生成JSON数据
"""
import sys
import io
import feedparser
import json
import time
import re
from datetime import datetime
from urllib.parse import urlparse
from html import unescape
import hashlib

# 修复Windows控制台编码问题
if sys.platform == 'win32':
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')
    sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding='utf-8')

def load_config():
    """加载配置文件"""
    with open('config.json', 'r', encoding='utf-8') as f:
        return json.load(f)

def generate_id(url):
    """生成文章唯一ID"""
    return hashlib.md5(url.encode()).hexdigest()[:12]

def clean_html(text):
    """清理HTML标签，只保留纯文本"""
    if not text:
        return ''

    # 解码HTML实体 (如 &amp; &lt; 等)
    text = unescape(text)

    # 移除HTML标签
    text = re.sub(r'<[^>]+>', '', text)

    # 移除多余的空白字符
    text = re.sub(r'\s+', ' ', text)

    # 去除首尾空格
    text = text.strip()

    return text

def parse_rss_feed(feed_url, feed_name, category, max_articles):
    """解析单个RSS源"""
    print(f"📡 正在抓取: {feed_name} ({feed_url})")

    try:
        feed = feedparser.parse(feed_url)
        articles = []

        for entry in feed.entries[:max_articles]:
            # 获取描述并清理HTML
            raw_description = entry.get('summary', entry.get('description', ''))
            clean_description = clean_html(raw_description)

            # 限制长度
            if len(clean_description) > 200:
                clean_description = clean_description[:200] + '...'

            article = {
                'id': generate_id(entry.link),
                'title': entry.get('title', '无标题'),
                'link': entry.get('link', ''),
                'description': clean_description,
                'published': entry.get('published', entry.get('updated', '')),
                'source': feed_name,
                'category': category,
                'timestamp': time.time()
            }
            articles.append(article)

        print(f"✅ {feed_name}: 成功抓取 {len(articles)} 篇文章")
        return articles

    except Exception as e:
        print(f"❌ {feed_name}: 抓取失败 - {str(e)}")
        return []

def scrape_all_feeds():
    """抓取所有RSS源"""
    config = load_config()
    all_articles = []

    print("\n" + "="*60)
    print("🚀 开始自动抓取科技资讯...")
    print("="*60 + "\n")

    for feed in config['rss_feeds']:
        articles = parse_rss_feed(
            feed['url'],
            feed['name'],
            feed['category'],
            config.get('max_articles_per_feed', 20)
        )
        all_articles.extend(articles)
        time.sleep(1)  # 避免请求过快

    # 去重（根据ID）
    seen_ids = set()
    unique_articles = []
    for article in all_articles:
        if article['id'] not in seen_ids:
            seen_ids.add(article['id'])
            unique_articles.append(article)

    # 按时间戳排序
    unique_articles.sort(key=lambda x: x['timestamp'], reverse=True)

    return unique_articles

def save_data(articles):
    """保存数据到JSON文件"""
    data = {
        'last_updated': datetime.now().isoformat(),
        'total_articles': len(articles),
        'articles': articles
    }

    with open('public/data.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)

    print(f"\n✅ 数据已保存: {len(articles)} 篇文章")
    print(f"📄 文件位置: public/data.json")

def main():
    """主函数"""
    try:
        articles = scrape_all_feeds()
        save_data(articles)

        print("\n" + "="*60)
        print("🎉 抓取完成！")
        print("="*60)
        print(f"总计: {len(articles)} 篇文章")
        print(f"更新时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")

    except Exception as e:
        print(f"\n❌ 错误: {str(e)}")
        raise

if __name__ == '__main__':
    main()
