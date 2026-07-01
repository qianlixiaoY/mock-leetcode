import { computed, onBeforeUnmount, ref, shallowRef, watch, type Ref } from 'vue'
import { monaco, setupMonaco } from '../setup'
import { canFormatLanguage, formatDocument } from '../features/format'
import { registerEditorKeybindings } from '../features/keybindings'
import { createMetaHoverProvider } from '../features/meta-hover'
import { registerOjSnippets } from '../features/snippets'
import { createTemplateGuard, type TemplateGuard } from '../features/template-guard'
import { buildTemplateLayout } from '../features/template-layout'
import { configureOjTypes } from '../languages/oj-types'
import {
  loadFontSize,
  loadTheme,
  nextFontSize,
  saveFontSize,
  saveTheme,
  themeLabel,
  toggleThemeName,
} from '../features/preferences'
import type { ProblemMeta } from '@/types'
import type { MonacoEditorCallbacks } from '../types'

interface UseMonacoEditorOptions {
  containerRef: Ref<HTMLElement | undefined>
  getValue: () => string
  getLanguage: () => string
  getTemplate?: () => string
  getMeta?: () => ProblemMeta | null | undefined
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
  registerOjSnippets(monaco)

  const editor = shallowRef<monaco.editor.IStandaloneCodeEditor | null>(null)
  const fontSize = ref(loadFontSize())
  const theme = ref(loadTheme())
  const disposables: monaco.IDisposable[] = []
  const featureDisposables: monaco.IDisposable[] = []
  let templateGuard: TemplateGuard | null = null
  let guardActive = false
  let syncingExternalValue = false

  const canFormat = computed(() => canFormatLanguage(options.getLanguage()))
  const hasTemplateGuard = computed(() => {
    const template = options.getTemplate?.() ?? ''
    const layout = buildTemplateLayout(template, options.getLanguage())
    return layout.editableCount > 0 && template.length > 0
  })

  function clearOjFeatures() {
    for (const disposable of featureDisposables) {
      disposable.dispose()
    }
    featureDisposables.length = 0
    templateGuard?.dispose()
    templateGuard = null
    guardActive = false
  }

  function mountOjFeatures(instance: monaco.editor.IStandaloneCodeEditor) {
    clearOjFeatures()
    configureOjTypes(monaco, options.getMeta?.(), options.getLanguage())
    featureDisposables.push(createMetaHoverProvider(monaco, () => options.getMeta?.()))

    if (hasTemplateGuard.value && options.getTemplate) {
      guardActive = true
      templateGuard = createTemplateGuard(instance, monaco, {
        getTemplate: options.getTemplate,
        getLanguage: options.getLanguage,
        onValidChange: (value) => options.onValueChange(value),
      })
    }
  }

  function mount() {
    if (!options.containerRef.value || editor.value) {
      return
    }

    const instance = monaco.editor.create(
      options.containerRef.value,
      createEditorOptions(fontSize.value, options.getLanguage()),
    )

    syncingExternalValue = true
    instance.setValue(options.getValue())
    syncingExternalValue = false
    monaco.editor.setTheme(theme.value)

    disposables.push(
      instance.onDidChangeModelContent(() => {
        if (syncingExternalValue || guardActive) {
          return
        }
        options.onValueChange(instance.getValue())
      }),
    )

    registerEditorKeybindings(instance, monaco, options.callbacks ?? {})
    mountOjFeatures(instance)
    editor.value = instance
  }

  function dispose() {
    clearOjFeatures()
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
        syncingExternalValue = true
        editor.value.setValue(value)
        syncingExternalValue = false
        templateGuard?.applyLayout()
      }
    },
  )

  watch(
    () => [options.getLanguage(), options.getTemplate?.(), options.getMeta?.()] as const,
    () => {
      if (!editor.value) {
        return
      }
      const model = editor.value.getModel()
      if (model) {
        monaco.editor.setModelLanguage(model, options.getLanguage())
      }
      mountOjFeatures(editor.value)
      templateGuard?.applyLayout()
      configureOjTypes(monaco, options.getMeta?.(), options.getLanguage())
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
    hasTemplateGuard,
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
