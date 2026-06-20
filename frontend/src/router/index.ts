import { createRouter, createWebHistory } from 'vue-router'
import ProblemList from '@/views/ProblemList.vue'
import ProblemSolve from '@/views/ProblemSolve.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', redirect: '/problems' },
    { path: '/problems', component: ProblemList },
    { path: '/problems/:id', component: ProblemSolve, props: true },
  ],
})

export default router
