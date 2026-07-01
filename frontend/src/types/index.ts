export type Difficulty = 'EASY' | 'MEDIUM' | 'HARD'

export type Language = 'JAVA' | 'JAVASCRIPT' | 'PYTHON' | 'TYPESCRIPT'

export type JudgeStatus =
  | 'PENDING'
  | 'JUDGING'
  | 'ACCEPTED'
  | 'WRONG_ANSWER'
  | 'TIME_LIMIT_EXCEEDED'
  | 'MEMORY_LIMIT_EXCEEDED'
  | 'RUNTIME_ERROR'
  | 'COMPILE_ERROR'
  | 'SYSTEM_ERROR'

export interface ApiResponse<T> {
  code: number
  message: string
  data: T
}

export interface User {
  id: number
  username: string
}

export interface AuthResponse {
  token: string
  user: User
}

export interface ProblemSummary {
  id: number
  title: string
  slug: string
  difficulty: Difficulty
}

export interface TestCaseView {
  id: number
  input: string
  expectedOutput: string
}

export interface ProblemMetaParam {
  name: string
  type: string
}

export interface ProblemMetaReturn {
  type: string
  size?: number
}

export interface ProblemMetaMethod {
  name: string
  params: ProblemMetaParam[]
  return?: ProblemMetaReturn
}

export interface ProblemMeta {
  name?: string
  classname?: string
  systemdesign?: boolean
  params?: ProblemMetaParam[]
  return?: ProblemMetaReturn
  constructor?: { params: ProblemMetaParam[] }
  methods?: ProblemMetaMethod[]
}

export interface ProblemDetail {
  id: number
  title: string
  slug: string
  difficulty: Difficulty
  descriptionMd: string
  timeLimitMs: number
  memoryLimitMb: number
  sampleTestCases: TestCaseView[]
  templates: Partial<Record<Language, string>>
  meta: ProblemMeta
}

export interface Submission {
  id: number
  problemId: number
  language: Language
  status: JudgeStatus
  runtimeMs?: number
  memoryKb?: number
  passedCases?: number
  totalCases?: number
  errorMessage?: string
  stdout?: string
  stderr?: string
  createdAt: string
}

export interface RunResult {
  status: JudgeStatus
  stdout?: string
  stderr?: string
  expectedOutput?: string
  runtimeMs?: number
}

export const LANGUAGE_OPTIONS: { label: string; value: Language; monaco: string }[] = [
  { label: 'Java', value: 'JAVA', monaco: 'java' },
  { label: 'JavaScript', value: 'JAVASCRIPT', monaco: 'javascript' },
  { label: 'Python', value: 'PYTHON', monaco: 'python' },
  { label: 'TypeScript', value: 'TYPESCRIPT', monaco: 'typescript' },
]

export const JUDGE_SUPPORTED_LANGUAGES: Language[] = ['JAVA', 'JAVASCRIPT', 'TYPESCRIPT']

export const STATUS_LABEL: Record<JudgeStatus, string> = {
  PENDING: '等待中',
  JUDGING: '判题中',
  ACCEPTED: '通过',
  WRONG_ANSWER: '答案错误',
  TIME_LIMIT_EXCEEDED: '超时',
  MEMORY_LIMIT_EXCEEDED: '内存超限',
  RUNTIME_ERROR: '运行错误',
  COMPILE_ERROR: '编译错误',
  SYSTEM_ERROR: '系统错误',
}

export const DIFFICULTY_LABEL: Record<Difficulty, string> = {
  EASY: '简单',
  MEDIUM: '中等',
  HARD: '困难',
}
