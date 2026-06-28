import { createRouter, createWebHashHistory, createWebHistory } from 'vue-router'
import ProblemList from '@/views/ProblemList.vue'
import ProblemSolve from '@/views/ProblemSolve.vue'
import Login from '@/views/Login.vue'

const isElectron = import.meta.env.VITE_ELECTRON === 'true'

const router = createRouter({
  history: isElectron ? createWebHashHistory() : createWebHistory(),
  routes: [
    { path: '/', redirect: '/problems' },
    { path: '/login', component: Login },
    { path: '/problems', component: ProblemList },
    { path: '/problems/:id', component: ProblemSolve, props: true },
  ],
})

export default router
