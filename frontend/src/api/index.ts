import axios from 'axios'
import type {
  ApiResponse,
  Language,
  ProblemDetail,
  ProblemSummary,
  RunResult,
  Submission,
} from '@/types'

const http = axios.create({
  baseURL: '/api',
  timeout: 30000,
})

http.interceptors.response.use((response) => {
  const payload = response.data as ApiResponse<unknown>
  if (payload.code !== 0) {
    return Promise.reject(new Error(payload.message || 'Request failed'))
  }
  response.data = payload.data
  return response
})

export async function fetchProblems() {
  const { data } = await http.get<ProblemSummary[]>('/problems')
  return data
}

export async function fetchProblem(id: number) {
  const { data } = await http.get<ProblemDetail>(`/problems/${id}`)
  return data
}

export async function fetchDraft(problemId: number, language: Language) {
  const { data } = await http.get<{ code: string }>(`/problems/${problemId}/draft`, {
    params: { language },
  })
  return data.code
}

export async function saveDraft(problemId: number, language: Language, code: string) {
  await http.put(`/problems/${problemId}/draft`, { language, code })
}

export async function runCode(payload: {
  problemId: number
  language: Language
  code: string
  input: string
}) {
  const { data } = await http.post<RunResult>('/submissions/run', payload)
  return data
}

export async function submitCode(payload: {
  problemId: number
  language: Language
  code: string
}) {
  const { data } = await http.post<Submission>('/submissions', payload)
  return data
}

export async function fetchSubmission(id: number) {
  const { data } = await http.get<Submission>(`/submissions/${id}`)
  return data
}

export async function fetchSubmissions(problemId: number) {
  const { data } = await http.get<Submission[]>('/submissions', {
    params: { problemId },
  })
  return data
}
