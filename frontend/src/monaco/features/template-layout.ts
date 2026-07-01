export type TemplateSegment =
  | { type: 'locked'; text: string }
  | { type: 'editable'; id: number; placeholder: string }

export interface TemplateLayout {
  segments: TemplateSegment[]
  editableCount: number
}

function isBraceLanguage(language: string) {
  return ['java', 'javascript', 'typescript'].includes(language)
}

function findMatchingBraceLine(lines: string[], openLine: number): number | null {
  let depth = 0
  for (let i = openLine; i < lines.length; i++) {
    for (const ch of lines[i]) {
      if (ch === '{') depth++
      if (ch === '}') depth--
    }
    if (depth === 0 && i > openLine) {
      return i
    }
  }
  return null
}

function isEmptyBlockBody(lines: string[], bodyStart: number, bodyEnd: number) {
  if (bodyStart >= bodyEnd) {
    return true
  }
  return lines.slice(bodyStart, bodyEnd).every((line) => line.trim() === '')
}

function findEmptyBraceBlocks(lines: string[]): Array<{ openLine: number; closeLine: number }> {
  const blocks: Array<{ openLine: number; closeLine: number }> = []

  for (let i = 0; i < lines.length; i++) {
    if (!lines[i].includes('{')) {
      continue
    }

    const closeLine = findMatchingBraceLine(lines, i)
    if (closeLine == null) {
      continue
    }

    const bodyStart = i + 1
    const bodyEnd = closeLine
    const bodyText = lines.slice(bodyStart, bodyEnd).join('\n')
    if (bodyText.includes('{')) {
      continue
    }
    if (!isEmptyBlockBody(lines, bodyStart, bodyEnd)) {
      continue
    }

    blocks.push({ openLine: i, closeLine })
  }

  return blocks.filter((block, index, all) => {
    return !all.some(
      (other, otherIndex) =>
        otherIndex !== index &&
        block.openLine >= other.openLine &&
        block.closeLine <= other.closeLine &&
        (block.openLine > other.openLine || block.closeLine < other.closeLine),
    )
  })
}

function buildBraceLayout(template: string): TemplateLayout {
  const lines = template.split('\n')
  const blocks = findEmptyBraceBlocks(lines).sort((a, b) => a.openLine - b.openLine)
  const segments: TemplateSegment[] = []
  let lineCursor = 0
  let editableId = 0

  for (const block of blocks) {
    if (lineCursor <= block.openLine) {
      segments.push({
        type: 'locked',
        text: lines.slice(lineCursor, block.openLine + 1).join('\n') + '\n',
      })
    }

    const bodyStart = block.openLine + 1
    const bodyEnd = block.closeLine
    segments.push({
      type: 'editable',
      id: editableId++,
      placeholder: lines.slice(bodyStart, bodyEnd).join('\n'),
    })

    segments.push({
      type: 'locked',
      text: lines[block.closeLine] + '\n',
    })

    lineCursor = block.closeLine + 1
  }

  if (lineCursor < lines.length) {
    segments.push({ type: 'locked', text: lines.slice(lineCursor).join('\n') })
  }

  return finalizeLayout(segments)
}

function buildPythonLayout(template: string): TemplateLayout {
  const lines = template.split('\n')
  const segments: TemplateSegment[] = []
  let editableId = 0
  let cursor = 0

  const defPattern = /^(\s*)def\s+\w+\s*\(/
  const classPattern = /^(\s*)class\s+\w+/

  for (let i = 0; i < lines.length; i++) {
    const defMatch = lines[i].match(defPattern)
    if (!defMatch) {
      continue
    }

    const indent = defMatch[1].length
    let j = i + 1

    while (j < lines.length && (lines[j].trim() === '' || lines[j].trimStart().startsWith('"""') || lines[j].trimStart().startsWith("'''"))) {
      if (lines[j].trimStart().startsWith('"""') || lines[j].trimStart().startsWith("'''")) {
        const quote = lines[j].trimStart().startsWith('"""') ? '"""' : "'''"
        j++
        while (j < lines.length && !lines[j].includes(quote)) {
          j++
        }
      }
      j++
    }

    let bodyEnd = j
    while (bodyEnd < lines.length) {
      const line = lines[bodyEnd]
      if (line.trim() === '') {
        bodyEnd++
        continue
      }
      const leading = line.match(/^(\s*)/)?.[1].length ?? 0
      if (leading <= indent && (defPattern.test(line) || classPattern.test(line))) {
        break
      }
      bodyEnd++
    }

    const bodyLines = lines.slice(j, bodyEnd)
    const hasEditableSlot = bodyLines.length === 0 || bodyLines.every((line) => line.trim() === '')
    if (!hasEditableSlot) {
      continue
    }

    if (cursor <= i) {
      segments.push({ type: 'locked', text: lines.slice(cursor, j).join('\n') + (j > cursor ? '\n' : '') })
    }

    segments.push({
      type: 'editable',
      id: editableId++,
      placeholder: bodyLines.join('\n'),
    })

    cursor = bodyEnd
    i = bodyEnd - 1
  }

  if (segments.length === 0) {
    return { segments: [{ type: 'locked', text: template }], editableCount: 0 }
  }

  if (cursor < lines.length) {
    segments.push({ type: 'locked', text: lines.slice(cursor).join('\n') })
  }

  return finalizeLayout(segments)
}

function finalizeLayout(segments: TemplateSegment[]): TemplateLayout {
  const merged: TemplateSegment[] = []
  for (const segment of segments) {
    if (segment.type === 'locked' && segment.text === '') {
      continue
    }
    const last = merged[merged.length - 1]
    if (segment.type === 'locked' && last?.type === 'locked') {
      last.text += segment.text
      continue
    }
    merged.push({ ...segment })
  }

  const editableCount = merged.filter((segment) => segment.type === 'editable').length
  return { segments: merged, editableCount }
}

export function buildTemplateLayout(template: string, language: string): TemplateLayout {
  if (!template) {
    return { segments: [{ type: 'locked', text: '' }], editableCount: 0 }
  }

  if (isBraceLanguage(language)) {
    const layout = buildBraceLayout(template)
    if (layout.editableCount > 0) {
      return layout
    }
  }

  if (language === 'python') {
    return buildPythonLayout(template)
  }

  return { segments: [{ type: 'editable', id: 0, placeholder: template }], editableCount: 1 }
}

export function assembleTemplate(layout: TemplateLayout, editableParts: string[]): string {
  let editableIndex = 0
  return layout.segments
    .map((segment) => {
      if (segment.type === 'locked') {
        return segment.text
      }
      const part = editableParts[editableIndex] ?? segment.placeholder
      editableIndex++
      return part
    })
    .join('')
}

export function disassembleTemplate(code: string, layout: TemplateLayout): { ok: boolean; parts: string[] } {
  const parts: string[] = []
  let cursor = 0
  const segments = layout.segments

  for (let i = 0; i < segments.length; i++) {
    const segment = segments[i]
    if (segment.type === 'locked') {
      if (!code.startsWith(segment.text, cursor)) {
        return { ok: false, parts: [] }
      }
      cursor += segment.text.length
      continue
    }

    let nextLockedText: string | null = null
    for (let j = i + 1; j < segments.length; j++) {
      const next = segments[j]
      if (next.type === 'locked') {
        nextLockedText = next.text
        break
      }
    }

    if (nextLockedText == null) {
      parts.push(code.slice(cursor))
      cursor = code.length
      continue
    }

    const end = code.indexOf(nextLockedText, cursor)
    if (end < 0) {
      return { ok: false, parts: [] }
    }
    parts.push(code.slice(cursor, end))
    cursor = end
  }

  if (cursor !== code.length) {
    return { ok: false, parts: [] }
  }

  return { ok: true, parts }
}

export function getDefaultEditableParts(layout: TemplateLayout): string[] {
  return layout.segments
    .filter((segment): segment is Extract<TemplateSegment, { type: 'editable' }> => segment.type === 'editable')
    .map((segment) => segment.placeholder)
}

export function getLockedLineDecorations(
  monacoApi: typeof import('monaco-editor'),
  layout: TemplateLayout,
  code: string,
): import('monaco-editor').editor.IModelDeltaDecoration[] {
  const disassembled = disassembleTemplate(code, layout)
  if (!disassembled.ok) {
    return []
  }

  const decorations: import('monaco-editor').editor.IModelDeltaDecoration[] = []
  let offset = 0
  let partIndex = 0

  for (const segment of layout.segments) {
    if (segment.type === 'locked') {
      const startLine = code.slice(0, offset).split('\n').length
      const lineCount = Math.max(1, segment.text.split('\n').length - (segment.text.endsWith('\n') ? 1 : 0))
      for (let i = 0; i < lineCount; i++) {
        const lineNumber = startLine + i
        decorations.push({
          range: new monacoApi.Range(lineNumber, 1, lineNumber, 1),
          options: {
            isWholeLine: true,
            className: 'template-locked-line',
            stickiness: monacoApi.editor.TrackedRangeStickiness.NeverGrowsWhenTypingAtEdges,
          },
        })
      }
      offset += segment.text.length
      continue
    }

    const part = disassembled.parts[partIndex++] ?? segment.placeholder
    offset += part.length
  }

  return decorations
}
