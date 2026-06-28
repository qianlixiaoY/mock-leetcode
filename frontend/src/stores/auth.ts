import { defineStore } from 'pinia'
import { computed, ref } from 'vue'
import { fetchMe, login as loginApi, register as registerApi, setToken, getToken } from '@/api'
import type { User } from '@/types'

export const useAuthStore = defineStore('auth', () => {
  const token = ref<string | null>(getToken())
  const user = ref<User | null>(null)
  const ready = ref(false)

  const isAuthenticated = computed(() => !!token.value && !!user.value)

  async function restoreSession() {
    if (!token.value) {
      ready.value = true
      return
    }

    try {
      user.value = await fetchMe()
    } catch {
      clearSession()
    } finally {
      ready.value = true
    }
  }

  async function login(username: string, password: string) {
    const response = await loginApi(username, password)
    applyAuth(response.token, response.user)
  }

  async function register(username: string, password: string) {
    const response = await registerApi(username, password)
    applyAuth(response.token, response.user)
  }

  function applyAuth(nextToken: string, nextUser: User) {
    token.value = nextToken
    user.value = nextUser
    setToken(nextToken)
  }

  function clearSession() {
    token.value = null
    user.value = null
    setToken(null)
  }

  function logout() {
    clearSession()
  }

  return {
    token,
    user,
    ready,
    isAuthenticated,
    restoreSession,
    login,
    register,
    logout,
    clearSession,
  }
})
