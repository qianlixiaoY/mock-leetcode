<template>
  <div class="page">
    <header class="header">
      <h1>Mock LeetCode OJ</h1>
      <p>Vue 3 + Java 在线判题系统 Demo</p>
    </header>

    <el-table :data="problems" v-loading="loading" class="table" stripe>
      <el-table-column prop="id" label="#" width="80" />
      <el-table-column label="题目">
        <template #default="{ row }: { row: ProblemSummary }">
          <router-link :to="`/problems/${row.id}`" class="link">
            {{ row.title }}
          </router-link>
        </template>
      </el-table-column>
      <el-table-column label="难度" width="120">
        <template #default="{ row }: { row: ProblemSummary }">
          <el-tag :type="difficultyType(row.difficulty)" effect="dark">
            {{ DIFFICULTY_LABEL[row.difficulty] }}
          </el-tag>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { fetchProblems } from '@/api'
import type { Difficulty, ProblemSummary } from '@/types'
import { DIFFICULTY_LABEL } from '@/types'

const problems = ref<ProblemSummary[]>([])
const loading = ref(false)

onMounted(async () => {
  loading.value = true
  try {
    problems.value = await fetchProblems()
  } finally {
    loading.value = false
  }
})

function difficultyType(difficulty: Difficulty) {
  if (difficulty === 'EASY') return 'success'
  if (difficulty === 'MEDIUM') return 'warning'
  return 'danger'
}
</script>

<style scoped>
.page {
  max-width: 960px;
  margin: 0 auto;
  padding: 32px 20px;
}

.header h1 {
  margin: 0 0 8px;
}

.header p {
  margin: 0 0 24px;
  color: var(--oj-text-muted);
}

.table {
  background: transparent;
}

.link {
  color: #58a6ff;
  text-decoration: none;
}

.link:hover {
  text-decoration: underline;
}
</style>
