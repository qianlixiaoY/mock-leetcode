<template>
  <el-dialog
    v-model="visible"
    :title="dialogTitle"
    width="420px"
    destroy-on-close
    append-to-body
    class="login-dialog"
    @closed="onClosed"
  >
    <LoginForm
      :initial-tab="auth.loginDialog.tab"
      :reason="auth.loginDialog.reason"
      @success="onSuccess"
    />

    <template #footer>
      <div class="dialog-footer">
        <router-link
          v-if="fullPageLink"
          :to="fullPageLink"
          class="full-page-link"
          @click="visible = false"
        >
          在完整页面登录
        </router-link>
        <el-button @click="visible = false">取消</el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRoute } from 'vue-router'
import LoginForm from '@/components/auth/LoginForm.vue'
import { useAuthStore } from '@/stores/auth'

const auth = useAuthStore()
const route = useRoute()

const visible = computed({
  get: () => auth.loginDialog.visible,
  set: (value: boolean) => {
    if (!value) {
      auth.closeLoginDialog(false)
    }
  },
})

const dialogTitle = computed(() =>
  auth.loginDialog.tab === 'register' ? '注册账号' : '登录',
)

const fullPageLink = computed(() => {
  if (route.path === '/login') {
    return null
  }
  return {
    path: '/login',
    query: {
      redirect: route.fullPath,
      tab: auth.loginDialog.tab,
    },
  }
})

function onSuccess() {
  auth.closeLoginDialog(true)
}

function onClosed() {
  if (auth.loginDialog.visible) {
    auth.closeLoginDialog(false)
  }
}
</script>

<style scoped>
.dialog-footer {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 12px;
}

.full-page-link {
  margin-right: auto;
  color: #58a6ff;
  font-size: 13px;
  text-decoration: none;
}

.full-page-link:hover {
  text-decoration: underline;
}
</style>
