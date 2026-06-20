<template>
  <div ref="containerRef" class="code-editor"></div>
</template>

<script setup lang="ts">
import { onBeforeUnmount, onMounted, ref, watch } from 'vue'
import * as monaco from 'monaco-editor'
import editorWorker from 'monaco-editor/esm/vs/editor/editor.worker?worker'
import jsonWorker from 'monaco-editor/esm/vs/language/json/json.worker?worker'
import cssWorker from 'monaco-editor/esm/vs/language/css/css.worker?worker'
import htmlWorker from 'monaco-editor/esm/vs/language/html/html.worker?worker'
import tsWorker from 'monaco-editor/esm/vs/language/typescript/ts.worker?worker'

window.MonacoEnvironment = {
  getWorker(_moduleId, label) {
    if (label === 'json') return new jsonWorker()
    if (label === 'css' || label === 'scss' || label === 'less') return new cssWorker()
    if (label === 'html' || label === 'handlebars' || label === 'razor') return new htmlWorker()
    if (label === 'typescript' || label === 'javascript') return new tsWorker()
    return new editorWorker()
  },
} as monaco.Environment

const props = defineProps<{
  modelValue: string
  language: string
}>()

const emit = defineEmits<{
  'update:modelValue': [value: string]
}>()

const containerRef = ref<HTMLDivElement>()
let editor: monaco.editor.IStandaloneCodeEditor | null = null

onMounted(() => {
  if (!containerRef.value) return
  console.log('container ref......', containerRef.value, props)
  editor = monaco.editor.create(containerRef.value, {
    value: props.modelValue,
    language: props.language,
    theme: 'vs-dark',
    automaticLayout: true,
    fontSize: 14,
    minimap: { enabled: false },
    scrollBeyondLastLine: false,
    tabSize: 4,
    wordWrap: 'on',
  })

  editor.onDidChangeModelContent(() => {
    console.log('emit......', editor?.getValue())
    emit('update:modelValue', editor?.getValue() ?? '')
  })
})

watch(
  () => props.modelValue,
  (value) => {
    if (editor && value !== editor.getValue()) {
      editor.setValue(value)
    }
  },
)

watch(
  () => props.language,
  (language) => {
    if (editor) {
      monaco.editor.setModelLanguage(editor.getModel()!, language)
    }
  },
)

onBeforeUnmount(() => {
  editor?.dispose()
})
</script>

<style scoped>
.code-editor {
  width: 100%;
  height: 100%;
  min-height: 200px;
}
</style>
