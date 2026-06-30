import type * as monaco from 'monaco-editor'
import { FORMATTABLE_LANGUAGES } from '../constants'

export function canFormatLanguage(language: string) {
  return FORMATTABLE_LANGUAGES.has(language)
}

export async function formatDocument(editor: monaco.editor.IStandaloneCodeEditor): Promise<boolean> {
  const model = editor.getModel()
  if (!model || !canFormatLanguage(model.getLanguageId())) {
    return false
  }

  const action = editor.getAction('editor.action.formatDocument')
  if (!action) {
    return false
  }

  await action.run()
  return true
}
