# Mock LeetCode OJ

基于 **Vue 3 + Spring Boot + Docker** 的 LeetCode 风格在线判题系统 Demo。

包含三部分：

1. **Monorepo 脚手架** — 前端 + Java 多模块后端 + Docker Compose
2. **做题页 UI** — Splitpanes 分栏 + Monaco Editor，接近 LeetCode 布局
3. **Judge Worker** — Docker 沙箱中编译运行 Java / TypeScript 代码并判题

## 项目结构

```
mock-leetcode/
├── frontend/                 # Vue 3 前端
├── backend/
│   ├── oj-common/            # 共享 DTO / 枚举
│   ├── oj-api/               # REST API (8080)
│   └── oj-judge-worker/      # 判题 Worker (8081)
└── deploy/
    ├── docker-compose.yml    # MySQL + Redis + RabbitMQ
    └── judge-images/         # 判题镜像
        ├── java/
        └── typescript/
```

## 环境要求

- Node.js 18+
- JDK 17+
- Maven 3.9+
- Docker Desktop（判题必须）

## 快速启动

### 1. 启动基础设施

```bash
cd deploy
docker compose up -d
```

等待 MySQL 就绪（约 10–20 秒）。

### 2. 构建判题镜像

```bash
docker build -t oj-judge-java:latest deploy/judge-images/java
docker build -t oj-judge-typescript:latest deploy/judge-images/typescript
```

### 3. 启动后端

```bash
cd backend
mvn clean install -DskipTests
```

新开两个终端，顺序不限：

```bash
cd backend
mvn -pl oj-api spring-boot:run          # API，端口 8080
```

```bash
cd backend
mvn -pl oj-judge-worker spring-boot:run   # 判题 Worker，端口 8081
```

### 4. 启动前端

```bash
cd frontend
npm install
npm run dev
```

浏览器访问：http://localhost:5173

## 功能说明

| 功能 | 状态 |
|------|------|
| 题目列表 / 题面 Markdown 渲染 | ✅ |
| Monaco 代码编辑器 + 多语言模板 | ✅ |
| 代码草稿自动保存 | ✅ |
| Run（自定义输入运行） | ✅ Java、TypeScript |
| Submit（隐藏用例异步判题） | ✅ Java、TypeScript |
| 提交记录 | ✅ |
| Docker 沙箱判题 | ✅ |

> Demo 阶段 **Run / Submit 判题支持 Java、TypeScript**。JavaScript / Python 可编辑代码，但提交会提示不支持。

## 判题流程

```
前端 Submit → oj-api 创建 submission → RabbitMQ
    → oj-judge-worker 消费消息
    → Docker 编译运行用户代码
    → 回调 oj-api 更新结果
    → 前端轮询获取状态
```

## 示例：买卖股票 II（题目 122）

**Java 参考解：**

```java
class Solution {
    public int maxProfit(int[] prices) {
        int profit = 0;
        for (int i = 1; i < prices.length; i++) {
            if (prices[i] > prices[i - 1]) {
                profit += prices[i] - prices[i - 1];
            }
        }
        return profit;
    }
}
```

点击 **运行** 测试样例，点击 **提交** 进行完整判题。

**TypeScript 参考解：**

```typescript
function maxProfit(prices: number[]): number {
    let profit = 0;
    for (let i = 1; i < prices.length; i++) {
        if (prices[i] > prices[i - 1]) {
            profit += prices[i] - prices[i - 1];
        }
    }
    return profit;
}
```

## API 概览

| 方法 | 路径 | 说明 |
|------|------|------|
| GET | `/api/problems` | 题目列表 |
| GET | `/api/problems/{id}` | 题目详情 |
| PUT | `/api/problems/{id}/draft` | 保存草稿 |
| POST | `/api/submissions/run` | 运行代码 |
| POST | `/api/submissions` | 提交判题 |
| GET | `/api/submissions/{id}` | 查询判题结果 |

## Windows 注意事项

- 判题 Worker 通过 Docker 挂载临时目录，需确保 **Docker Desktop 已启动**。
- 若 Docker 挂载路径报错，可在 `oj-judge-worker` 的 `application.yml` 中设置 `oj.docker.enabled: false`，将回退为本地执行（无沙箱隔离，仅调试用）。Java 需本机 `javac/java`，TypeScript 需本机 `node` + `ts-node`。

## 后续扩展

- [ ] 支持 Python / JavaScript 判题镜像
- [ ] WebSocket 替代轮询
- [ ] 用户登录与 JWT
- [ ] 管理员题目录入后台
