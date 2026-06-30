import {
  FONT_SIZE_DEFAULT,
  FONT_SIZE_MAX,
  FONT_SIZE_MIN,
  FONT_SIZE_STEP,
  OJ_DARK_THEME,
  STORAGE_FONT_SIZE,
  STORAGE_THEME,
  VS_DARK_THEME,
} from '../constants'

export function loadFontSize(): number {
  const stored = Number(localStorage.getItem(STORAGE_FONT_SIZE))
  if (Number.isFinite(stored) && stored >= FONT_SIZE_MIN && stored <= FONT_SIZE_MAX) {
    return stored
  }
  return FONT_SIZE_DEFAULT
}

export function saveFontSize(size: number) {
  localStorage.setItem(STORAGE_FONT_SIZE, String(size))
}

export function loadTheme(): string {
  const stored = localStorage.getItem(STORAGE_THEME)
  return stored === VS_DARK_THEME ? VS_DARK_THEME : OJ_DARK_THEME
}

export function saveTheme(theme: string) {
  localStorage.setItem(STORAGE_THEME, theme)
}

export function clampFontSize(size: number) {
  return Math.min(FONT_SIZE_MAX, Math.max(FONT_SIZE_MIN, size))
}

export function nextFontSize(current: number, delta: number) {
  return clampFontSize(current + delta * FONT_SIZE_STEP)
}

export function toggleThemeName(current: string) {
  return current === OJ_DARK_THEME ? VS_DARK_THEME : OJ_DARK_THEME
}

export function themeLabel(theme: string) {
  return theme === OJ_DARK_THEME ? 'OJ 暗色' : 'VS 暗色'
}
