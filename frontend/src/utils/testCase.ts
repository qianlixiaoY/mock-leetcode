export type TestCaseInputObject = Record<string, unknown>

export function parseTestCaseInput(input: string): TestCaseInputObject {
  try {
    const parsed = JSON.parse(input) as unknown
    if (typeof parsed === 'object' && parsed !== null && !Array.isArray(parsed)) {
      return parsed as TestCaseInputObject
    }
  } catch {
    // fall through
  }
  return { input }
}

export function stringifyTestCaseInput(input: TestCaseInputObject): string {
  return JSON.stringify(input)
}

export function formatTestCaseInput(input: string): string {
  return JSON.stringify(parseTestCaseInput(input), null, 2)
}

export function formatFieldValue(value: unknown): string {
  if (value === null || value === undefined) {
    return ''
  }
  if (typeof value === 'string') {
    return value
  }
  return JSON.stringify(value, null, 2)
}

export function parseFieldValue(text: string): unknown {
  const trimmed = text.trim()
  if (!trimmed) {
    return ''
  }
  try {
    return JSON.parse(trimmed)
  } catch {
    return trimmed
  }
}

export function formatTestCaseInputSummary(input: string): string {
  try {
    const parsed = parseTestCaseInput(input)
    return Object.entries(parsed)
      .map(([key, value]) => `${key} = ${JSON.stringify(value)}`)
      .join(', ')
  } catch {
    // fall through
  }
  return input
}

export function normalizeTestCaseInputForCompare(input: string | TestCaseInputObject): string {
  try {
    const parsed = typeof input === 'string' ? JSON.parse(input) : input
    return JSON.stringify(parsed)
  } catch {
    return typeof input === 'string' ? input.trim() : JSON.stringify(input)
  }
}
