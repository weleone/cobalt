# cobalt API - Docker 镜像
# 基于官方 Dockerfile 优化，支持多阶段构建
# 构建: docker build -t cobalt:latest .
# 运行: docker run -d -p 9009:9009 -e API_URL="https://api.example.com/" -e API_PORT="9009" cobalt:latest

FROM node:24-alpine AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
# pnpm 版本与项目 packageManager 保持一致
ENV COREPACK_ENABLE_DOWNLOAD_PROMPT=0
ENV COREPACK_NPM_REGISTRY=https://registry.npmmirror.com

FROM base AS build
WORKDIR /app
COPY . /app

RUN corepack enable && corepack prepare pnpm@9.6.0 --activate
RUN apk add --no-cache python3 alpine-sdk

# 利用 BuildKit 缓存加速 pnpm
RUN --mount=type=cache,id=pnpm,target=/pnpm/store \
    pnpm install --prod --frozen-lockfile

# 仅部署 api 及其生产依赖，减小体积
RUN pnpm deploy --filter=@imput/cobalt-api --prod /prod/api

FROM base AS api
LABEL org.opencontainers.image.title="cobalt API" \
      org.opencontainers.image.description="cobalt media downloader API - best way to save what you love" \
      org.opencontainers.image.source="https://github.com/imputnet/cobalt" \
      org.opencontainers.image.licenses="AGPL-3.0"

WORKDIR /app

COPY --from=build --chown=node:node /prod/api /app
# 保留 .git 用于版本信息展示 (@imput/version-info)
COPY --from=build --chown=node:node /app/.git /app/.git

# 健康检查：API 根路径应返回响应
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD node -e "fetch('http://127.0.0.1:9009/').then(r=>{if(!r.ok)process.exit(1)}).catch(()=>process.exit(1))"

USER node

EXPOSE 9009

# 必需环境变量: API_URL (例如 https://api.example.com/)
# 可选参考 docs/api-env-variables.md
CMD [ "node", "src/cobalt" ]
