export interface CodeEditorExpose {
  formatDocument: () => Promise<boolean>
  increaseFontSize: () => void
  decreaseFontSize: () => void
  toggleTheme: () => void
  focus: () => void
  fontSize: number
  theme: string
  canFormat: boolean
}

export interface MonacoEditorCallbacks {
  onRun?: () => void
  onSave?: () => void
}
