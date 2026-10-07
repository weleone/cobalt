# cobalt 前端简体中文语言包

从 cobalt `main` 分支的英文原文完整翻译，共 25 个 JSON + 4 个 md，
所有 key 与英文版一一对应，占位符（`{{ value }}` 等）原样保留。

## 安装（在 cobalt 源码根目录执行）

```bash
# 1. 解压本包到 web/i18n/ 下
tar -xzf cobalt-i18n-zh.tar.gz -C /path/to/cobalt/web/i18n/
# 解压后应有：web/i18n/zh/ 和 web/i18n/languages.json（已加入 "zh"）

# 2. 重新构建前端（两种方案二选一）
# 方案 A（docker + caddy，随 compose）：
docker compose up -d --build

# 方案 B（Lucky 静态托管）：
docker buildx build -f Dockerfile.web-build \
  --build-arg WEB_DEFAULT_API="http://192.168.0.3:9009/" \
  --output type=local,dest=/mnt/sdb1/docker/config/cobalt/web-dist \
  .
```

## 生效方式

- 浏览器语言是中文（`zh-CN` / `zh-TW` 等）时自动显示中文；
- 或在前端「设置 → 外观 → 语言」里手动选择「简体中文」。

## 注意

- 上游更新英文文案后，未同步的新 key 会自动回退显示英文（sveltekit-i18n 的
  fallbackLocale 机制），不会炸页面；
- 这是社区翻译，个别措辞可能不准，欢迎指出。
