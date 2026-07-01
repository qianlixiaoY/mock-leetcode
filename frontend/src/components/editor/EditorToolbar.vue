<template>
  <div class="editor-toolbar">
    <div class="left">
      <span class="title">代码编辑器</span>
        <span class="shortcut-hint">Ctrl+Enter 运行 · Ctrl+S 保存 · 模板区不可编辑</span>
    </div>

    <div class="tools">
      <el-tooltip content="Java / Python 暂不支持内置格式化" :disabled="canFormat">
        <el-button size="small" :disabled="!canFormat" @click="emit('format')">
          格式化
        </el-button>
      </el-tooltip>

      <el-button size="small" @click="emit('reset')">重置模板</el-button>

      <el-button-group class="font-group">
        <el-button size="small" title="减小字号" @click="emit('font-decrease')">A-</el-button>
        <span class="font-size">{{ fontSize }}</span>
        <el-button size="small" title="增大字号" @click="emit('font-increase')">A+</el-button>
      </el-button-group>

      <el-button size="small" @click="emit('toggle-theme')">{{ themeLabel }}</el-button>
    </div>

    <div v-if="$slots.extra" class="extra">
      <slot name="extra" />
    </div>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  canFormat: boolean
  fontSize: number
  themeLabel: string
}>()

const emit = defineEmits<{
  format: []
  reset: []
  'font-increase': []
  'font-decrease': []
  'toggle-theme': []
}>()
</script>

<style scoped>
.editor-toolbar {
  min-height: 36px;
  padding: 4px 12px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 12px;
  flex-wrap: wrap;
  border-bottom: 1px solid var(--oj-border);
  background: #1f1f1f;
}

.left {
  display: flex;
  align-items: center;
  gap: 12px;
  min-width: 0;
}

.title {
  color: var(--oj-text-muted);
  font-size: 13px;
  white-space: nowrap;
}

.shortcut-hint {
  color: #6b7280;
  font-size: 12px;
  white-space: nowrap;
}

.tools {
  display: flex;
  align-items: center;
  gap: 8px;
  flex-wrap: wrap;
}

.font-group {
  display: inline-flex;
  align-items: center;
}

.font-size {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 28px;
  padding: 0 4px;
  color: var(--oj-text-muted);
  font-size: 12px;
  border-top: 1px solid var(--oj-border);
  border-bottom: 1px solid var(--oj-border);
}

.extra {
  margin-left: auto;
}

@media (max-width: 960px) {
  .shortcut-hint {
    display: none;
  }
}
</style>
