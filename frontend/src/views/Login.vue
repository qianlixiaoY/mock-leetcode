<template>
  <div class="login-page">
    <div class="login-card">
      <h1>Mock LeetCode OJ</h1>
      <p class="subtitle">登录后开始做题、保存草稿与查看提交记录</p>

      <el-tabs v-model="activeTab">
        <el-tab-pane label="登录" name="login">
          <el-form :model="loginForm" @submit.prevent="handleLogin">
            <el-form-item label="用户名">
              <el-input v-model="loginForm.username" autocomplete="username" />
            </el-form-item>
            <el-form-item label="密码">
              <el-input
                v-model="loginForm.password"
                type="password"
                show-password
                autocomplete="current-password"
              />
            </el-form-item>
            <el-button type="primary" native-type="submit" :loading="loading" class="submit-btn">
              登录
            </el-button>
          </el-form>
          <p class="hint">Demo 账号：demo / demo123</p>
        </el-tab-pane>

        <el-tab-pane label="注册" name="register">
          <el-form :model="registerForm" @submit.prevent="handleRegister">
            <el-form-item label="用户名">
              <el-input
                v-model="registerForm.username"
                autocomplete="username"
                placeholder="3-64 个字符"
              />
            </el-form-item>
            <el-form-item label="密码">
              <el-input
                v-model="registerForm.password"
                type="password"
                show-password
                autocomplete="new-password"
                placeholder="至少 6 个字符"
              />
            </el-form-item>
            <el-button type="primary" native-type="submit" :loading="loading" class="submit-btn">
              注册
            </el-button>
          </el-form>
        </el-tab-pane>
      </el-tabs>

      <el-alert v-if="error" type="error" :title="error" show-icon :closable="false" class="error" />

      <router-link to="/problems" class="back-link">← 返回题目列表（无需登录）</router-link>
    </div>
  </div>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { useAuthStore } from '@/stores/auth'

const auth = useAuthStore()
const router = useRouter()
const route = useRoute()

const activeTab = ref(route.query.tab === 'register' ? 'register' : 'login')
const loading = ref(false)
const error = ref('')

const loginForm = reactive({ username: '', password: '' })
const registerForm = reactive({ username: '', password: '' })

function redirectAfterAuth() {
  const redirect = typeof route.query.redirect === 'string' ? route.query.redirect : '/problems'
  router.replace(redirect)
}

async function handleLogin() {
  error.value = ''
  loading.value = true
  try {
    await auth.login(loginForm.username.trim(), loginForm.password)
    ElMessage.success('登录成功')
    redirectAfterAuth()
  } catch (err) {
    error.value = err instanceof Error ? err.message : '登录失败'
  } finally {
    loading.value = false
  }
}

async function handleRegister() {
  error.value = ''
  loading.value = true
  try {
    await auth.register(registerForm.username.trim(), registerForm.password)
    ElMessage.success('注册成功')
    redirectAfterAuth()
  } catch (err) {
    error.value = err instanceof Error ? err.message : '注册失败'
  } finally {
    loading.value = false
  }
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

.submit-btn {
  width: 100%;
}

.hint {
  margin: 12px 0 0;
  font-size: 13px;
  color: var(--oj-text-muted);
}

.error {
  margin-top: 16px;
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
