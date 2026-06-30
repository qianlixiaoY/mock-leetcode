<template>
  <div ref="containerRef" class="code-editor"></div>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { useMonacoEditor } from '@/monaco/composables/useMonacoEditor'

const props = defineProps<{
  modelValue: string
  language: string
}>()

const emit = defineEmits<{
  'update:modelValue': [value: string]
  run: []
  save: []
}>()

const containerRef = ref<HTMLDivElement>()

const {
  mount,
  formatDocument,
  increaseFontSize,
  decreaseFontSize,
  toggleTheme,
  focus,
  fontSize,
  theme,
  themeLabel,
  canFormat,
} = useMonacoEditor({
  containerRef,
  getValue: () => props.modelValue,
  getLanguage: () => props.language,
  onValueChange: (value) => emit('update:modelValue', value),
  callbacks: {
    onRun: () => emit('run'),
    onSave: () => emit('save'),
  },
})

onMounted(mount)

defineExpose({
  formatDocument,
  increaseFontSize,
  decreaseFontSize,
  toggleTheme,
  focus,
  fontSize,
  theme,
  themeLabel,
  canFormat,
})
</script>

<style scoped>
.code-editor {
  width: 100%;
  height: 100%;
  min-height: 200px;
}
</style>
