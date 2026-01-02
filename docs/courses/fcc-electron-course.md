# Free code camp - Electron course
https://www.youtube.com/watch?v=fP-371MN0Ck

## Intro and how electron works
* vite + react + ts (browser runtime) => html, js, css in `dist-react` (vite and ts transpiles into browser compatible js)
* electron + ts (node runtime) => js files in `dist-electron` (ts compiles into node js)
* electron-builder + html, css, js (browser) in `dist-react` + js (node) => `dist` (packages into desktop application dmg, appImage, msi)

## Setting up react
* Create normal react vite website
*  Move web app related stuff to ui folder
*  Update index.html file to use `src/ui/main.ts`
*  Change ouptut build `dir` from dist to `dist-react` in `vite.config.ts`
*  Change the paths in built index html from absolute to relative paths using `base` in 
`vite.config.ts`

## Setting up electron
* Install electron
* Modify web app tsconfig to include only `src/ui` folder
* Create new tsconfig for electron app inside `src/electron`

## Adding typescript
* tell vite ts config to exclude `"src/elctorn"`
* create `tsconfig.json` in `src/electron`
* set outdir in ts config to `../../dist-electron`
* create command `transpile:electron: "tsc --project src/electron/tsconfig.json"`

## Configuring electron-builder.json
* create `electron-builder.json` at root
* create custom icon

## DX improvements
* use npm package `cross-env` to define env variables in npm run commangds in `package.json`
* in `src/electron/main.ts` load the vite dev url or bundled app path based on if development or production.
* in `vite.config.ts`