import { computed, onBeforeUnmount, ref, shallowRef, watch, type Ref } from 'vue'
import { monaco, setupMonaco } from '../setup'
import { canFormatLanguage, formatDocument } from '../features/format'
import { registerEditorKeybindings } from '../features/keybindings'
import {
  loadFontSize,
  loadTheme,
  nextFontSize,
  saveFontSize,
  saveTheme,
  themeLabel,
  toggleThemeName,
} from '../features/preferences'
import type { MonacoEditorCallbacks } from '../types'

interface UseMonacoEditorOptions {
  containerRef: Ref<HTMLElement | undefined>
  getValue: () => string
  getLanguage: () => string
  onValueChange: (value: string) => void
  callbacks?: MonacoEditorCallbacks
}

function createEditorOptions(fontSize: number, language: string) {
  return {
    value: '',
    language,
    theme: loadTheme(),
    automaticLayout: true,
    fontSize,
    fontFamily: "Consolas, 'Courier New', monospace",
    fontLigatures: false,
    minimap: { enabled: false },
    scrollBeyondLastLine: false,
    tabSize: 4,
    insertSpaces: true,
    wordWrap: 'on' as const,
    lineNumbers: 'on' as const,
    renderLineHighlight: 'all' as const,
    smoothScrolling: true,
    cursorBlinking: 'smooth' as const,
    cursorSmoothCaretAnimation: 'on' as const,
    padding: { top: 8, bottom: 8 },
    bracketPairColorization: { enabled: true },
    guides: {
      bracketPairs: true,
      bracketPairsHorizontal: true,
      indentation: true,
      highlightActiveIndentation: true,
    },
    stickyScroll: { enabled: true },
    quickSuggestions: {
      other: true,
      comments: false,
      strings: false,
    },
    suggestOnTriggerCharacters: true,
    formatOnPaste: true,
  }
}

export function useMonacoEditor(options: UseMonacoEditorOptions) {
  setupMonaco()

  const editor = shallowRef<monaco.editor.IStandaloneCodeEditor | null>(null)
  const fontSize = ref(loadFontSize())
  const theme = ref(loadTheme())
  const disposables: monaco.IDisposable[] = []

  const canFormat = computed(() => canFormatLanguage(options.getLanguage()))

  function mount() {
    if (!options.containerRef.value || editor.value) {
      return
    }

    const instance = monaco.editor.create(
      options.containerRef.value,
      createEditorOptions(fontSize.value, options.getLanguage()),
    )

    instance.setValue(options.getValue())
    monaco.editor.setTheme(theme.value)

    disposables.push(
      instance.onDidChangeModelContent(() => {
        options.onValueChange(instance.getValue())
      }),
    )

    registerEditorKeybindings(instance, monaco, options.callbacks ?? {})
    editor.value = instance
  }

  function dispose() {
    for (const disposable of disposables) {
      disposable.dispose()
    }
    disposables.length = 0
    editor.value?.dispose()
    editor.value = null
  }

  watch(
    () => options.getValue(),
    (value) => {
      if (editor.value && value !== editor.value.getValue()) {
        editor.value.setValue(value)
      }
    },
  )

  watch(
    () => options.getLanguage(),
    (language) => {
      const model = editor.value?.getModel()
      if (model) {
        monaco.editor.setModelLanguage(model, language)
      }
    },
  )

  watch(fontSize, (size) => {
    editor.value?.updateOptions({ fontSize: size })
    saveFontSize(size)
  })

  watch(theme, (nextTheme) => {
    monaco.editor.setTheme(nextTheme)
    saveTheme(nextTheme)
  })

  onBeforeUnmount(dispose)

  async function formatDocumentAction() {
    if (!editor.value) {
      return false
    }
    return formatDocument(editor.value)
  }

  function increaseFontSize() {
    fontSize.value = nextFontSize(fontSize.value, 1)
  }

  function decreaseFontSize() {
    fontSize.value = nextFontSize(fontSize.value, -1)
  }

  function toggleTheme() {
    theme.value = toggleThemeName(theme.value)
  }

  function focus() {
    editor.value?.focus()
  }

  return {
    editor,
    fontSize,
    theme,
    canFormat,
    themeLabel: computed(() => themeLabel(theme.value)),
    mount,
    dispose,
    formatDocument: formatDocumentAction,
    increaseFontSize,
    decreaseFontSize,
    toggleTheme,
    focus,
  }
}
