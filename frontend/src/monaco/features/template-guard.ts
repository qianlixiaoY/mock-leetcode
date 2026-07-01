import type * as monaco from 'monaco-editor'
import {
  assembleTemplate,
  buildTemplateLayout,
  disassembleTemplate,
  getDefaultEditableParts,
  getLockedLineDecorations,
  type TemplateLayout,
} from './template-layout'

export interface TemplateGuardOptions {
  getTemplate: () => string
  getLanguage: () => string
  onValidChange: (value: string) => void
}

export interface TemplateGuard {
  applyLayout: () => void
  dispose: () => void
}

export function createTemplateGuard(
  editor: monaco.editor.IStandaloneCodeEditor,
  monacoApi: typeof monaco,
  options: TemplateGuardOptions,
): TemplateGuard {
  let layout: TemplateLayout = buildTemplateLayout(options.getTemplate(), options.getLanguage())
  let lastValidValue = editor.getValue()
  let decorationIds: string[] = []
  let applying = false

  function refreshDecorations() {
    decorationIds = editor.deltaDecorations(
      decorationIds,
      getLockedLineDecorations(monacoApi, layout, editor.getValue()),
    )
  }

  function applyLayout() {
    layout = buildTemplateLayout(options.getTemplate(), options.getLanguage())
    const current = editor.getValue()
    const parsed = disassembleTemplate(current, layout)
    const parts = parsed.ok ? parsed.parts : getDefaultEditableParts(layout)
    const nextValue = assembleTemplate(layout, parts)
    applying = true
    editor.setValue(nextValue)
    applying = false
    lastValidValue = nextValue
    refreshDecorations()
  }

  const changeDisposable = editor.onDidChangeModelContent(() => {
    if (applying) {
      return
    }

    const current = editor.getValue()
    const parsed = disassembleTemplate(current, layout)
    if (!parsed.ok) {
      applying = true
      editor.setValue(lastValidValue)
      applying = false
      return
    }

    lastValidValue = current
    options.onValidChange(current)
    refreshDecorations()
  })

  applyLayout()

  return {
    applyLayout,
    dispose: () => {
      changeDisposable.dispose()
      decorationIds = editor.deltaDecorations(decorationIds, [])
    },
  }
}
