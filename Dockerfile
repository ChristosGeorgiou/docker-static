FROM node:18-alpine

RUN npm i -g pnpm

WORKDIR /app

EXPOSE 3000

COPY package*.json ./
COPY pnpm-lock.yaml ./

RUN pnpm install

COPY . .

RUN pnpm run build

ENV NODE_ENV=production
ENV APP_DIR=./app

# HEALTHCHECK --interval=10s --timeout=10s --start-period=10s \
#   CMD node dist/healthcheck.js http://localhost:3000/health/check

CMD ["node", "."]
