import axios, { type AxiosError } from 'axios'
import type {
  ApiResponse,
  AuthResponse,
  Language,
  ProblemDetail,
  ProblemSummary,
  RunResult,
  Submission,
  User,
} from '@/types'

const TOKEN_KEY = 'oj_token'

export function getToken() {
  return localStorage.getItem(TOKEN_KEY)
}

export function setToken(token: string | null) {
  if (token) {
    localStorage.setItem(TOKEN_KEY, token)
  } else {
    localStorage.removeItem(TOKEN_KEY)
  }
}

const http = axios.create({
  baseURL: import.meta.env.VITE_API_BASE || '/api',
  timeout: 30000,
})

http.interceptors.request.use((config) => {
  const token = getToken()
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
})

http.interceptors.response.use(
  (response) => {
    const payload = response.data as ApiResponse<unknown>
    if (payload.code !== 0) {
      return Promise.reject(new Error(payload.message || 'Request failed'))
    }
    response.data = payload.data
    return response
  },
  (error: AxiosError<ApiResponse<unknown>>) => {
    const status = error.response?.status
    const message = error.response?.data?.message || error.message || 'Request failed'

    if (status === 401 && !error.config?.url?.includes('/auth/login')) {
      setToken(null)
      window.dispatchEvent(new CustomEvent('oj:unauthorized'))
    }

    return Promise.reject(new Error(message))
  },
)

export async function login(username: string, password: string) {
  const { data } = await http.post<AuthResponse>('/auth/login', { username, password })
  return data
}

export async function register(username: string, password: string) {
  const { data } = await http.post<AuthResponse>('/auth/register', { username, password })
  return data
}

export async function fetchMe() {
  const { data } = await http.get<User>('/auth/me')
  return data
}

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
