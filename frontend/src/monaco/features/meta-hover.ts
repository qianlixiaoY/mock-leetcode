import type * as monaco from 'monaco-editor'
import type { ProblemMeta } from '@/types'
import { formatMetaType } from '../languages/oj-types'

function formatFunctionSignature(meta: ProblemMeta): string | null {
  if (meta.systemdesign) {
    const className = meta.classname ?? 'Solution'
    const methods = meta.methods ?? []
    if (methods.length === 0) {
      return `class ${className}`
    }
    return methods
      .map((method) => {
        const params = (method.params ?? [])
          .map((param) => `${formatMetaType(param.type)} ${param.name}`)
          .join(', ')
        const ret = method.return?.type ? `: ${formatMetaType(method.return.type)}` : ''
        return `${method.name}(${params})${ret}`
      })
      .join('\n')
  }

  if (!meta.name) {
    return null
  }

  const params = (meta.params ?? [])
    .map((param) => `${formatMetaType(param.type)} ${param.name}`)
    .join(', ')
  const ret = meta.return?.type ? `: ${formatMetaType(meta.return.type)}` : ''
  return `${meta.name}(${params})${ret}`
}

function buildHoverMarkdown(meta: ProblemMeta): string {
  const signature = formatFunctionSignature(meta)
  const lines = ['**题目函数签名**']
  if (signature) {
    lines.push('```', signature, '```')
  }

  if (meta.params?.length) {
    lines.push('', '**参数**')
    for (const param of meta.params) {
      lines.push(`- \`${param.name}\`: ${formatMetaType(param.type)}`)
    }
  }

  if (meta.return?.type) {
    lines.push('', `**返回值**: ${formatMetaType(meta.return.type)}`)
  }

  if (meta.methods?.length) {
    lines.push('', '**方法**')
    for (const method of meta.methods) {
      const params = (method.params ?? []).map((p) => `${p.name}: ${p.type}`).join(', ')
      lines.push(`- \`${method.name}(${params})\` → ${method.return?.type ?? 'void'}`)
    }
  }

  return lines.join('\n')
}

export function createMetaHoverProvider(
  monacoApi: typeof monaco,
  getMeta: () => ProblemMeta | null | undefined,
): monaco.IDisposable {
  const languages = ['java', 'javascript', 'typescript', 'python']
  const disposables = languages.map((language) =>
    monacoApi.languages.registerHoverProvider(language, {
      provideHover(model, position) {
        const meta = getMeta()
        if (!meta) {
          return null
        }

        const line = model.getLineContent(position.lineNumber)
        const names = [
          meta.name,
          meta.classname,
          ...(meta.methods?.map((method) => method.name) ?? []),
        ].filter(Boolean) as string[]

        const matched = names.some((name) => line.includes(name))
        if (!matched) {
          return null
        }

        return {
          range: new monacoApi.Range(position.lineNumber, 1, position.lineNumber, line.length + 1),
          contents: [{ value: buildHoverMarkdown(meta) }],
        }
      },
    }),
  )

  return {
    dispose: () => disposables.forEach((item) => item.dispose()),
  }
}
