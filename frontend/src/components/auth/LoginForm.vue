<template>
  <div class="login-form">
    <p v-if="reason" class="reason">{{ reason }}</p>

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
  </div>
</template>

<script setup lang="ts">
import { reactive, ref, watch } from 'vue'
import { ElMessage } from 'element-plus'
import { useAuthStore, type AuthTab } from '@/stores/auth'

const props = withDefaults(
  defineProps<{
    initialTab?: AuthTab
    reason?: string
  }>(),
  {
    initialTab: 'login',
    reason: '',
  },
)

const emit = defineEmits<{
  success: []
}>()

const auth = useAuthStore()
const activeTab = ref<AuthTab>(props.initialTab)
const loading = ref(false)
const error = ref('')

const loginForm = reactive({ username: '', password: '' })
const registerForm = reactive({ username: '', password: '' })

watch(
  () => props.initialTab,
  (tab) => {
    activeTab.value = tab
  },
)

async function handleLogin() {
  error.value = ''
  loading.value = true
  try {
    await auth.login(loginForm.username.trim(), loginForm.password)
    ElMessage.success('登录成功')
    emit('success')
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
    emit('success')
  } catch (err) {
    error.value = err instanceof Error ? err.message : '注册失败'
  } finally {
    loading.value = false
  }
}
</script>

<style scoped>
.reason {
  margin: 0 0 16px;
  padding: 10px 12px;
  border-radius: 8px;
  background: rgba(88, 166, 255, 0.1);
  color: #8b949e;
  font-size: 13px;
  line-height: 1.5;
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
</style>
