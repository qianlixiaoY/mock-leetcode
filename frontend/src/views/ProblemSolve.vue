<template>
  <div class="solve-page" v-loading="store.loading">
    <header class="topbar">
      <div class="left">
        <router-link to="/problems" class="back">← 题目列表</router-link>
        <span v-if="store.problem" class="title">
          {{ store.problem.id }}. {{ store.problem.title }}
        </span>
        <el-tag v-if="store.problem" effect="dark" type="warning">
          {{ DIFFICULTY_LABEL[store.problem.difficulty] }}
        </el-tag>
      </div>
      <div class="actions">
        <el-select
          v-model="store.language"
          size="small"
          style="width: 140px"
          @change="onLanguageChange"
        >
          <el-option
            v-for="item in LANGUAGE_OPTIONS"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          />
        </el-select>
        <el-button size="small" :loading="store.running" @click="store.run(problemId)">
          运行
        </el-button>
        <el-button
          size="small"
          type="success"
          :loading="store.submitting"
          @click="store.submit(problemId)"
        >
          提交
        </el-button>
        <span class="hint">{{ store.savedHint }}</span>
      </div>
    </header>

    <Splitpanes class="main-panes">
      <Pane min-size="25" size="38">
        <div class="panel left-panel">
          <el-tabs v-model="store.leftTab" class="panel-tabs">
            <el-tab-pane label="题目描述" name="desc">
              <div class="scroll-area">
                <MarkdownView v-if="store.problem" :content="store.problem.descriptionMd" />
              </div>
            </el-tab-pane>
            <el-tab-pane label="提交记录" name="records">
              <div class="scroll-area">
                <div
                  v-for="item in store.submissions"
                  :key="item.id"
                  class="record-item"
                  @click="showSubmission(item)"
                >
                  <div class="record-head">
                    <span>#{{ item.id }}</span>
                    <el-tag size="small" :type="statusTag(item.status)">
                      {{ STATUS_LABEL[item.status] }}
                    </el-tag>
                  </div>
                  <div class="record-meta">
                    {{ item.language }} · {{ formatTime(item.createdAt) }}
                    <span v-if="item.runtimeMs != null"> · {{ item.runtimeMs }} ms</span>
                  </div>
                </div>
                <el-empty v-if="store.submissions.length === 0" description="暂无提交记录" />
              </div>
            </el-tab-pane>
          </el-tabs>
        </div>
      </Pane>

      <Pane min-size="35">
        <Splitpanes horizontal>
          <Pane min-size="35" size="62">
            <div class="panel editor-panel">
              <div class="editor-toolbar">
                <span>代码编辑器</span>
                <span v-if="!JUDGE_SUPPORTED_LANGUAGES.includes(store.language)" class="warn">
                  判题 Demo 当前支持 Java、JavaScript、TypeScript
                </span>
              </div>
              <CodeEditor
                v-model="store.code"
                :language="monacoLanguage"
                @update:model-value="onCodeChange"
              />
            </div>
          </Pane>
          <Pane min-size="20">
            <div class="panel console-panel">
              <el-tabs v-model="store.activeConsoleTab" class="panel-tabs">
                <el-tab-pane label="测试用例" name="cases">
                  <div class="scroll-area console-content">
                    <div class="case-tabs">
                      <el-button
                        v-for="(sample, index) in store.problem?.sampleTestCases ?? []"
                        :key="sample.id"
                        size="small"
                        :type="
                          normalizeTestCaseInputForCompare(store.customInput) ===
                          normalizeTestCaseInputForCompare(sample.input)
                            ? 'primary'
                            : 'default'
                        "
                        @click="store.customInput = parseTestCaseInput(sample.input)"
                      >
                        示例 {{ index + 1 }}
                      </el-button>
                    </div>
                    <label class="label">输入</label>
                    <div class="input-row" v-for="inputKey in Object.keys(store.customInput)" :key="inputKey">
                      <label>{{ inputKey }}</label>
                      <el-input
                        :model-value="formatFieldValue(store.customInput[inputKey])"
                        type="textarea"
                        :rows="4"
                        resize="none"
                        @update:model-value="updateCustomInputField(inputKey, $event)"
                      />
                    </div>
                  </div>
                </el-tab-pane>
                <el-tab-pane label="测试结果" name="result">
                  <div class="scroll-area console-content">
                    <pre class="result-pre">{{ store.runResult || '请先执行代码' }}</pre>
                  </div>
                </el-tab-pane>
              </el-tabs>
            </div>
          </Pane>
        </Splitpanes>
      </Pane>
    </Splitpanes>
  </div>
</template>

<script setup lang="ts">
import { computed, onBeforeUnmount, onMounted } from 'vue'
import { Splitpanes, Pane } from 'splitpanes'
import CodeEditor from '@/components/CodeEditor.vue'
import MarkdownView from '@/components/MarkdownView.vue'
import { useProblemStore } from '@/stores/problem'
import {
  DIFFICULTY_LABEL,
  JUDGE_SUPPORTED_LANGUAGES,
  LANGUAGE_OPTIONS,
  STATUS_LABEL,
  type JudgeStatus,
  type Submission,
} from '@/types'
import {
  formatFieldValue,
  normalizeTestCaseInputForCompare,
  parseFieldValue,
  parseTestCaseInput,
} from '@/utils/testCase'

const props = defineProps<{ id: string }>()
const problemId = computed(() => Number(props.id))
const store = useProblemStore()

const monacoLanguage = computed(
  () => LANGUAGE_OPTIONS.find((item) => item.value === store.language)?.monaco ?? 'java',
)

onMounted(async () => {
  await store.loadProblem(problemId.value)
})

function updateCustomInputField(key: string, value: string) {
  store.customInput[key] = parseFieldValue(value)
}

onBeforeUnmount(() => {
  store.cleanup()
})

function onLanguageChange() {
  store.changeLanguage(problemId.value, store.language)
}

function onCodeChange() {
  store.scheduleSave(problemId.value)
}

function showSubmission(item: Submission) {
  store.activeConsoleTab = 'result'
  store.runResult = store.formatSubmission(item)
}

function statusTag(status: JudgeStatus) {
  if (status === 'ACCEPTED') return 'success'
  if (status === 'PENDING' || status === 'JUDGING') return 'info'
  return 'danger'
}

function formatTime(value: string) {
  return new Date(value).toLocaleString()
}
</script>

<style scoped>
.solve-page {
  height: 100vh;
  display: flex;
  flex-direction: column;
  background: var(--oj-bg);
}

.topbar {
  height: 52px;
  padding: 0 16px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  border-bottom: 1px solid var(--oj-border);
  background: #111;
}

.left {
  display: flex;
  align-items: center;
  gap: 12px;
}

.back {
  color: #8b949e;
  text-decoration: none;
}

.title {
  font-weight: 600;
}

.actions {
  display: flex;
  align-items: center;
  gap: 10px;
}

.hint {
  color: var(--oj-text-muted);
  font-size: 12px;
  min-width: 48px;
}

.main-panes {
  flex: 1;
  min-height: 0;
}

.panel {
  height: 100%;
  display: flex;
  flex-direction: column;
  background: var(--oj-panel);
}

.panel-tabs {
  height: 100%;
  display: flex;
  flex-direction: column;
}

.panel-tabs :deep(.el-tabs__header) {
  margin: 0;
  padding: 0 12px;
  background: #1f1f1f;
}

.panel-tabs :deep(.el-tabs__content) {
  flex: 1;
  min-height: 0;
}

.panel-tabs :deep(.el-tab-pane) {
  height: 100%;
}

.scroll-area {
  height: 100%;
  overflow: auto;
  padding: 16px;
}

.editor-panel {
  min-height: 0;
}

.editor-toolbar {
  height: 36px;
  padding: 0 12px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  border-bottom: 1px solid var(--oj-border);
  color: var(--oj-text-muted);
  font-size: 13px;
}

.warn {
  color: #e6a23c;
}

.console-panel {
  min-height: 0;
}

.console-content {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.case-tabs {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
}

.label {
  font-size: 13px;
  color: var(--oj-text-muted);
}

.input-row {
  margin-top: 12px;
}

.result-pre {
  margin: 0;
  white-space: pre-wrap;
  word-break: break-word;
  font-family: Consolas, 'Courier New', monospace;
  font-size: 13px;
  line-height: 1.6;
}

.record-item {
  padding: 10px 12px;
  border: 1px solid var(--oj-border);
  border-radius: 8px;
  margin-bottom: 10px;
  cursor: pointer;
}

.record-item:hover {
  border-color: #58a6ff;
}

.record-head {
  display: flex;
  justify-content: space-between;
  margin-bottom: 6px;
}

.record-meta {
  color: var(--oj-text-muted);
  font-size: 12px;
}
</style>
