# Neovim Keybindings Notes

## Исправленные пересечения (overlaps)

### 1) LSP форматирование
- **Было:** `<leader>f`
- **Стало:** `<leader>lf`
- **Почему:** `<leader>f` пересекался с Telescope-префиксом (`<leader>ff`, `<leader>fr`, ...), из-за чего были задержки/неоднозначность.

### 2) Jump list вперёд
- **Было:** `<C-m>` → `<C-i>`
- **Стало:** используется встроенный `<C-i>` без отдельного remap на `<C-m>`
- **Почему:** в терминале `<C-m>` обычно эквивалентен `Enter`, это создавало конфликт с `Enter`.

### 3) Neo-tree toggle
- Убран дублирующийся keybind из lazy-спеки плагина.
- Основной биндинг остаётся в `lua/config/keymaps.lua`:
  - `<leader>e` — Neo-tree toggle
  - `<leader>E` — reveal current file

## Актуальные изменения по файлам

- `lua/config/plugins/lsp.lua`
  - `<leader>f` → `<leader>lf`
- `lua/config/keymaps.lua`
  - удалён remap `<C-m>`
- `lua/config/plugins/neotree.lua`
  - `keys` заменён на `cmd = "Neotree"` (ленивая загрузка по команде)
