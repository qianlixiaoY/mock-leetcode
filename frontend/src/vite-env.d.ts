/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly VITE_ELECTRON?: string
  readonly VITE_API_BASE?: string
}

interface ImportMeta {
  readonly env: ImportMetaEnv
}

interface ElectronAPI {
  isElectron: boolean
  platform: string
  getBackendStatus: () => Promise<{ ok: boolean; message: string }>
  openExternal: (url: string) => Promise<void>
}

interface Window {
  electronAPI?: ElectronAPI
}

declare module '*.vue' {
  import type { DefineComponent } from 'vue'
  const component: DefineComponent<object, object, unknown>
  export default component
}

declare module 'splitpanes' {
  import type { DefineComponent } from 'vue'
  export const Splitpanes: DefineComponent<object, object, unknown>
  export const Pane: DefineComponent<object, object, unknown>
}
