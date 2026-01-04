# Electron

## Process model
https://www.electronjs.org/docs/latest/tutorial/process-model
Preload scripts
* Contain code that executes in a renderer process before its web content loads
* in main.js:
```ts
const { BrowserWindow } = require('electron')
// ...
const win = new BrowserWindow({
  webPreferences: {
    preload: 'path/to/preload.js'
  }
})
// ...
```
* context isolation means preload scripts are isolated from renderer's main world
* use `contextBridge` to share variables
```ts
const { contextBridge } = require('electron')

contextBridge.exposeInMainWorld('myAPI', {
  desktop: true
})
```

## Inter process communications
https://www.electronjs.org/docs/latest/tutorial/ipc
* Use preload script to import Node.js and Electron modules in a context-isolated renderer process.
* processes communicate by passing messages through developer-defined "channels" with the ipcMain and ipcRenderer 
* the renderer process has no Node.js or Electron module access
* Security warning: don't directly expose the whole ipcRenderer.send API for security reasons. Make sure to limit the renderer's access to Electron APIs as much as possible.
* renderer to main (one way): expose `ipcRenderer.send` in preload script to renderer. Use `ipcMain.on` in main process.
* renderer to main (two way): expose `ipcRenderer.invoke` in preload script. Use `ipcMain.handle` in main process.