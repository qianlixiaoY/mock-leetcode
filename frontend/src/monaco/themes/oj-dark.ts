import type * as monaco from 'monaco-editor'
import { OJ_DARK_THEME } from '../constants'

export function defineOjDarkTheme(monacoApi: typeof monaco) {
  monacoApi.editor.defineTheme(OJ_DARK_THEME, {
    base: 'vs-dark',
    inherit: true,
    rules: [
      { token: 'comment', foreground: '6b7280', fontStyle: 'italic' },
      { token: 'keyword', foreground: 'c678dd' },
      { token: 'string', foreground: '98c379' },
      { token: 'number', foreground: 'd19a66' },
      { token: 'type', foreground: 'e5c07b' },
    ],
    colors: {
      'editor.background': '#1a1a1a',
      'editor.foreground': '#eff1f6',
      'editorLineNumber.foreground': '#6b7280',
      'editorLineNumber.activeForeground': '#eff1f6',
      'editor.selectionBackground': '#264f78',
      'editor.inactiveSelectionBackground': '#264f7844',
      'editor.lineHighlightBackground': '#262626',
      'editorCursor.foreground': '#58a6ff',
      'editorIndentGuide.background': '#3a3a3a',
      'editorIndentGuide.activeBackground': '#6b7280',
      'editorBracketMatch.background': '#3a3a3a',
      'editorBracketMatch.border': '#58a6ff',
      'editorWidget.background': '#262626',
      'editorWidget.border': '#3a3a3a',
      'editorGutter.background': '#1a1a1a',
      'scrollbarSlider.background': '#3a3a3a88',
      'scrollbarSlider.hoverBackground': '#6b728088',
    },
  })
}
