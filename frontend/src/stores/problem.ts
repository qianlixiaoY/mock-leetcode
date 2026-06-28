import { defineStore } from 'pinia'
import { ref } from 'vue'
import type { Language, ProblemDetail, Submission } from '@/types'
import {
  fetchDraft,
  fetchProblem,
  fetchSubmission,
  fetchSubmissions,
  getToken,
  runCode,
  saveDraft,
  submitCode,
} from '@/api'
import { parseTestCaseInput, stringifyTestCaseInput } from '@/utils/testCase'
import type { TestCaseInputObject } from '@/utils/testCase'

export const useProblemStore = defineStore('problem', () => {
  const problem = ref<ProblemDetail | null>(null)
  const language = ref<Language>('JAVA')
  const code = ref('')
  const loading = ref(false)
  const running = ref(false)
  const submitting = ref(false)
  const customInput = ref<TestCaseInputObject>({})
  const runResult = ref<string>('')
  const activeConsoleTab = ref<'cases' | 'result'>('cases')
  const submissions = ref<Submission[]>([])
  const currentSubmission = ref<Submission | null>(null)
  const leftTab = ref<'desc' | 'records'>('desc')
  const savedHint = ref('')

  let saveTimer: ReturnType<typeof setTimeout> | null = null
  let pollTimer: ReturnType<typeof setInterval> | null = null

  async function loadProblem(id: number) {
    loading.value = true
    try {
      problem.value = await fetchProblem(id)
      if (problem.value.sampleTestCases.length > 0) {
        customInput.value = parseTestCaseInput(problem.value.sampleTestCases[0].input)
      }
      await loadCode(id)
      if (getToken()) {
        submissions.value = await fetchSubmissions(id)
      } else {
        submissions.value = []
      }
    } finally {
      loading.value = false
    }
  }

  async function loadCode(problemId: number) {
    const template = problem.value?.templates[language.value] ?? ''
    if (!getToken()) {
      code.value = template
      savedHint.value = ''
      return
    }

    const draft = await fetchDraft(problemId, language.value)
    code.value = draft || template
  }

  async function changeLanguage(problemId: number, next: Language) {
    language.value = next
    await loadCode(problemId)
  }

  function scheduleSave(problemId: number) {
    if (!getToken()) {
      savedHint.value = ''
      return
    }

    savedHint.value = '编辑中...'
    if (saveTimer) {
      clearTimeout(saveTimer)
    }
    saveTimer = setTimeout(async () => {
      await saveDraft(problemId, language.value, code.value)
      savedHint.value = '已保存'
    }, 1500)
  }

  async function run(problemId: number) {
    running.value = true
    activeConsoleTab.value = 'result'
    runResult.value = '执行中...'
    try {
      const result = await runCode({
        problemId,
        language: language.value,
        code: code.value,
        input: stringifyTestCaseInput(customInput.value),
      })
      runResult.value = [
        `状态: ${result.status}`,
        result.runtimeMs != null ? `耗时: ${result.runtimeMs} ms` : '',
        result.stdout ? `\n输出:\n${result.stdout}` : '',
        result.stderr ? `\n错误:\n${result.stderr}` : '',
      ]
        .filter(Boolean)
        .join('\n')
    } catch (error) {
      runResult.value = error instanceof Error ? error.message : '运行失败'
    } finally {
      running.value = false
    }
  }

  async function submit(problemId: number) {
    submitting.value = true
    activeConsoleTab.value = 'result'
    runResult.value = '提交中，等待判题...'
    try {
      const submission = await submitCode({
        problemId,
        language: language.value,
        code: code.value,
      })
      currentSubmission.value = submission
      pollSubmission(submission.id, problemId)
    } catch (error) {
      runResult.value = error instanceof Error ? error.message : '提交失败'
      submitting.value = false
    }
  }

  function pollSubmission(id: number, problemId: number) {
    if (pollTimer) {
      clearInterval(pollTimer)
    }
    pollTimer = setInterval(async () => {
      try {
        const submission = await fetchSubmission(id)
        currentSubmission.value = submission
        if (submission.status !== 'PENDING' && submission.status !== 'JUDGING') {
          if (pollTimer) {
            clearInterval(pollTimer)
            pollTimer = null
          }
          submitting.value = false
          submissions.value = await fetchSubmissions(problemId)
          runResult.value = formatSubmission(submission)
        } else {
          runResult.value = `判题中... (${submission.status})`
        }
      } catch (error) {
        if (pollTimer) {
          clearInterval(pollTimer)
          pollTimer = null
        }
        submitting.value = false
        runResult.value = error instanceof Error ? error.message : '获取判题结果失败'
      }
    }, 1500)
  }

  function formatSubmission(submission: Submission) {
    return [
      `状态: ${submission.status}`,
      submission.passedCases != null
        ? `通过用例: ${submission.passedCases}/${submission.totalCases}`
        : '',
      submission.runtimeMs != null ? `耗时: ${submission.runtimeMs} ms` : '',
      submission.errorMessage ? `\n详情:\n${submission.errorMessage}` : '',
      submission.stdout ? `\n输出:\n${submission.stdout}` : '',
      submission.stderr ? `\n错误:\n${submission.stderr}` : '',
    ]
      .filter(Boolean)
      .join('\n')
  }

  function cleanup() {
    if (saveTimer) {
      clearTimeout(saveTimer)
    }
    if (pollTimer) {
      clearInterval(pollTimer)
    }
  }

  return {
    problem,
    language,
    code,
    loading,
    running,
    submitting,
    customInput,
    runResult,
    activeConsoleTab,
    submissions,
    currentSubmission,
    leftTab,
    savedHint,
    loadProblem,
    changeLanguage,
    scheduleSave,
    run,
    submit,
    cleanup,
    formatSubmission,
  }
})
