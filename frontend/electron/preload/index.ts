import { contextBridge, ipcRenderer } from 'electron'

contextBridge.exposeInMainWorld('electronAPI', {
  isElectron: true,
  platform: process.platform,
  getBackendStatus: () =>
    ipcRenderer.invoke('backend:status') as Promise<{ ok: boolean; message: string }>,
  openExternal: (url: string) => ipcRenderer.invoke('shell:openExternal', url),
})
