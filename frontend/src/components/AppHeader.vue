<template>
  <header class="app-header">
    <router-link to="/problems" class="brand">Mock LeetCode OJ</router-link>
    <div class="actions">
      <template v-if="auth.isAuthenticated">
        <span class="username">{{ auth.user?.username }}</span>
        <el-button size="small" @click="handleLogout">退出</el-button>
      </template>
      <template v-else>
        <el-button size="small" @click="openLogin">登录</el-button>
        <el-button size="small" type="primary" @click="openRegister">注册</el-button>
      </template>
    </div>
  </header>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/auth'

const auth = useAuthStore()
const router = useRouter()

function openLogin() {
  auth.openLoginDialog()
}

function openRegister() {
  auth.openLoginDialog({ tab: 'register' })
}

function handleLogout() {
  auth.logout()
  router.push('/problems')
}
</script>

<style scoped>
.app-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 20px;
  border-bottom: 1px solid var(--oj-border);
  background: var(--oj-panel-bg);
}

.brand {
  color: inherit;
  font-weight: 600;
  text-decoration: none;
}

.actions {
  display: flex;
  align-items: center;
  gap: 8px;
}

.username {
  color: var(--oj-text-muted);
  font-size: 14px;
}
</style>
