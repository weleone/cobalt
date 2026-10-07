# cobalt 构建顺序（按序执行）

> 文件说明：
> - `Dockerfile` = API 镜像
> - `Dockerfile.web` = 前端 docker 镜像（caddy 提供服务），配合 compose 用
> - `Dockerfile.web-build` = 只构建前端静态文件，交 Lucky 静态文件服务托管用
> - 两个 Dockerfile 都放在 cobalt 源码根目录下执行。

```bash
# ---- 0. 准备 ----
git clone https://github.com/imputnet/cobalt
cd cobalt
# 把本包的 Dockerfile、Dockerfile.web(+Caddyfile) 解压到当前目录
# （Dockerfile 会覆盖官方原版，正是我们要的 9009 定制版）

# ---- 1. 构建 API 镜像 ----
docker buildx build --load --no-cache -t cobalt:latest .
# 说明：
# --load      buildx 的 docker-container 驱动必须加，否则镜像进不了本地仓库
# --no-cache  首次构建/缓存损坏时加，日常重构建可去掉
# 若默认 builder 已恢复，也可直接用：docker build -t cobalt:latest .

# ---- 2. 前端（二选一） ----

# 方案 A（推荐）：打包成 docker 镜像，随 compose 启动
#   不用单独执行，compose.yml 里已配好 build，第 3 步的 --build 会自动构建

# 方案 B：构建静态文件，交 Lucky 托管（不用 compose 里的 cobalt-web 服务）
docker buildx build -f Dockerfile.web-build \
  --build-arg WEB_DEFAULT_API="http://192.168.0.3:9009/" \
  --output type=local,dest=/mnt/sdb1/docker/config/cobalt/web-dist \
  .
# 说明：
# --output 只有 buildx 支持；产物（index.html 等）直接落到宿主机目录
# WEB_DEFAULT_API 写的是浏览器能访问到的 API 地址，变了要重跑这一步

# ---- 3. 启动 ----
# docker-compose.yml 放到 compose 目录后：
docker compose up -d --build
# --build 会自动构建 cobalt-web（方案 A）

# ---- 4. 验证 ----
docker ps | grep cobalt
curl -s http://192.168.0.3:9009/ | head -c 200
curl -s -o /dev/null -w "%{http_code}\n" http://192.168.0.3:9010/
# 两个都通就算成了，浏览器打开 http://192.168.0.3:9010
```

# ---- 方案 B 的 Lucky 配置（UI 操作，非命令） ----
Lucky 管理面板 -> Web 服务 -> 新增规则 -> 类型选「静态文件服务」，
根目录填 `/mnt/sdb1/docker/config/cobalt/web-dist`，监听端口填 `9010`。

# ---- 日常维护 ----
- 改 API 相关（Dockerfile/源码）：重跑 1、3
- 改 WEB_DEFAULT_API：方案 A 重跑 3（含 --build），方案 B 重跑 2
- 跨域：API 默认 CORS_WILDCARD=1 全放行；若关掉，需加 CORS_URL=http://192.168.0.3:9010
- cookies 单文件挂载注意：宿主机路径不存在时 docker 会自动建成目录，
  先 `touch` 建好空文件再启动，否则报 EISDIR
