import type * as monaco from 'monaco-editor'
import type { MonacoEditorCallbacks } from '../types'

export function registerEditorKeybindings(
  editor: monaco.editor.IStandaloneCodeEditor,
  monacoApi: typeof monaco,
  callbacks: MonacoEditorCallbacks,
) {
  editor.addCommand(monacoApi.KeyMod.CtrlCmd | monacoApi.KeyCode.Enter, () => {
    callbacks.onRun?.()
  })

  editor.addCommand(monacoApi.KeyMod.CtrlCmd | monacoApi.KeyCode.KeyS, () => {
    callbacks.onSave?.()
  })
}
