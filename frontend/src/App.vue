<template>
  <div class="app-shell">
    <AppHeader v-if="showHeader" />
    <el-alert
      v-if="backendWarning"
      class="backend-alert"
      type="warning"
      :closable="false"
      show-icon
      :title="backendWarning"
    />
    <router-view />
    <LoginDialog />
  </div>
</template>

<script setup lang="ts">
import { computed, onMounted, onUnmounted, ref } from 'vue'
import { useRoute } from 'vue-router'
import AppHeader from '@/components/AppHeader.vue'
import LoginDialog from '@/components/auth/LoginDialog.vue'
import { useAuthStore } from '@/stores/auth'

const route = useRoute()
const auth = useAuthStore()
const backendWarning = ref('')

const showHeader = computed(() => route.path !== '/login')

function onUnauthorized() {
  auth.clearSession()
}

onMounted(async () => {
  window.addEventListener('oj:unauthorized', onUnauthorized)
  await auth.restoreSession()

  if (!window.electronAPI?.isElectron) return

  const status = await window.electronAPI.getBackendStatus()
  if (!status.ok) {
    backendWarning.value = status.message
  }
})

onUnmounted(() => {
  window.removeEventListener('oj:unauthorized', onUnauthorized)
})
</script>

<style scoped>
.app-shell {
  min-height: 100vh;
}

.backend-alert {
  border-radius: 0;
}
</style>
