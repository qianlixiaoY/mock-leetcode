import type * as monaco from 'monaco-editor'
import type { ProblemMeta } from '@/types'

const TYPE_ALIASES: Record<string, string> = {
  'integer[]': 'number[]',
  'integer[][]': 'number[][]',
  integer: 'number',
  string: 'string',
  boolean: 'boolean',
  ListNode: 'ListNode',
  TreeNode: 'TreeNode',
}

function collectMetaTypes(meta: ProblemMeta | null | undefined): Set<string> {
  const types = new Set<string>()
  if (!meta) {
    return types
  }

  const addType = (raw?: string) => {
    if (!raw) return
    types.add(raw)
    if (raw.endsWith('[]')) {
      types.add(raw.slice(0, -2))
    }
  }

  meta.params?.forEach((param) => addType(param.type))
  addType(meta.return?.type)
  meta.constructor?.params?.forEach((param) => addType(param.type))
  meta.methods?.forEach((method) => {
    method.params?.forEach((param) => addType(param.type))
    addType(method.return?.type)
  })

  return types
}

function buildTypeScriptLib(types: Set<string>): string {
  const chunks: string[] = []

  if (types.has('ListNode')) {
    chunks.push(`
declare class ListNode {
  val: number
  next: ListNode | null
  constructor(val?: number, next?: ListNode | null)
}
`)
  }

  if (types.has('TreeNode')) {
    chunks.push(`
declare class TreeNode {
  val: number
  left: TreeNode | null
  right: TreeNode | null
  constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null)
}
`)
  }

  return chunks.join('\n')
}

function buildJavaScriptLib(types: Set<string>): string {
  return buildTypeScriptLib(types).replace(/declare class/g, 'class')
}

let lastSignature = ''

export function configureOjTypes(
  monacoApi: typeof monaco,
  meta: ProblemMeta | null | undefined,
  language: string,
) {
  const types = collectMetaTypes(meta)
  const signature = `${language}:${[...types].sort().join(',')}`
  if (signature === lastSignature) {
    return
  }
  lastSignature = signature

  const tsLib = buildTypeScriptLib(types)
  const jsLib = buildJavaScriptLib(types)

  if (language === 'typescript') {
    monacoApi.languages.typescript.typescriptDefaults.setExtraLibs([
      { content: tsLib, filePath: 'file:///oj-types.d.ts' },
    ])
    return
  }

  if (language === 'javascript') {
    monacoApi.languages.typescript.javascriptDefaults.setExtraLibs([
      { content: jsLib, filePath: 'file:///oj-types.js' },
    ])
  }
}

export function formatMetaType(type: string): string {
  return TYPE_ALIASES[type] ?? type
}
