import { app, BrowserWindow, ipcMain, Menu, shell } from 'electron'
import { existsSync } from 'node:fs'
import path from 'node:path'

let mainWindow: BrowserWindow | null = null

const isDev = !app.isPackaged

function resolvePreloadPath() {
  const base = path.join(__dirname, '../preload/index')
  if (existsSync(`${base}.js`)) return `${base}.js`
  if (existsSync(`${base}.mjs`)) return `${base}.mjs`
  return `${base}.js`
}

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1440,
    height: 900,
    minWidth: 960,
    minHeight: 640,
    title: 'Mock LeetCode OJ',
    webPreferences: {
      preload: resolvePreloadPath(),
      contextIsolation: true,
      nodeIntegration: false,
      sandbox: true,
    },
  })

  if (isDev && process.env.ELECTRON_RENDERER_URL) {
    mainWindow.loadURL(process.env.ELECTRON_RENDERER_URL)
    mainWindow.webContents.openDevTools({ mode: 'detach' })
  } else {
    mainWindow.loadFile(path.join(__dirname, '../renderer/index.html'))
  }

  mainWindow.on('closed', () => {
    mainWindow = null
  })
}

function buildMenu() {
  const template: Electron.MenuItemConstructorOptions[] = [
    {
      label: '文件',
      submenu: [{ role: 'quit', label: '退出' }],
    },
    {
      label: '视图',
      submenu: [
        { role: 'reload', label: '刷新' },
        { role: 'forceReload', label: '强制刷新' },
        { role: 'toggleDevTools', label: '开发者工具' },
        { type: 'separator' },
        { role: 'resetZoom', label: '重置缩放' },
        { role: 'zoomIn', label: '放大' },
        { role: 'zoomOut', label: '缩小' },
      ],
    },
    {
      label: '帮助',
      submenu: [
        {
          label: '后端 API 文档',
          click: () => shell.openExternal('http://127.0.0.1:8080'),
        },
      ],
    },
  ]

  Menu.setApplicationMenu(Menu.buildFromTemplate(template))
}

async function checkBackendHealth(): Promise<{ ok: boolean; message: string }> {
  try {
    const response = await fetch('http://127.0.0.1:8080/api/problems', {
      signal: AbortSignal.timeout(3000),
    })
    if (response.ok) {
      return { ok: true, message: '后端已就绪' }
    }
    return { ok: false, message: `后端响应异常 (${response.status})` }
  } catch {
    return {
      ok: false,
      message: '无法连接后端，请先启动 oj-api (8080) 及基础设施',
    }
  }
}

function registerIpcHandlers() {
  ipcMain.handle('backend:status', checkBackendHealth)
  ipcMain.handle('shell:openExternal', (_event, url: string) => shell.openExternal(url))
}

app.whenReady().then(async () => {
  buildMenu()
  registerIpcHandlers()
  createWindow()

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow()
    }
  })
})

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})
