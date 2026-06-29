<template>
  <div class="login-page">
    <div class="login-card">
      <h1>Mock LeetCode OJ</h1>
      <p class="subtitle">登录后开始做题、保存草稿与查看提交记录</p>

      <LoginForm :initial-tab="initialTab" @success="redirectAfterAuth" />

      <router-link to="/problems" class="back-link">← 返回题目列表（无需登录）</router-link>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import LoginForm from '@/components/auth/LoginForm.vue'
import type { AuthTab } from '@/stores/auth'

const router = useRouter()
const route = useRoute()

const initialTab = computed<AuthTab>(() =>
  route.query.tab === 'register' ? 'register' : 'login',
)

function redirectAfterAuth() {
  const redirect = typeof route.query.redirect === 'string' ? route.query.redirect : '/problems'
  router.replace(redirect)
}
</script>

<style scoped>
.login-page {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 24px;
}

.login-card {
  width: 100%;
  max-width: 420px;
  padding: 32px;
  border: 1px solid var(--oj-border);
  border-radius: 12px;
  background: var(--oj-panel-bg);
}

h1 {
  margin: 0 0 8px;
  font-size: 24px;
}

.subtitle {
  margin: 0 0 24px;
  color: var(--oj-text-muted);
}

.back-link {
  display: inline-block;
  margin-top: 20px;
  color: #58a6ff;
  text-decoration: none;
}

.back-link:hover {
  text-decoration: underline;
}
</style>
