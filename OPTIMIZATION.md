# Neovim Optimization Summary

## Обзор изменений

Конфигурация Neovim была оптимизирована для профессиональной работы с **Rust**, **C/C++**, **Go**, **TypeScript/JavaScript** и **Markdown**.

## 🚀 Основные улучшения

### 1. LSP конфигурация (astrolsp.lua)

#### Включены inlay hints для всех языков:
- **Rust**: типы переменных, параметры, lifetime hints, chain hints
- **Go**: типы, параметры, константы, composite literals
- **TypeScript/JavaScript**: типы переменных, параметры, return types
- **C/C++**: улучшенная интеграция с clangd

#### Оптимизация:
- Увеличен timeout форматирования до 2000ms
- Включены экспериментальные диагностики для Rust
- Настроен Clippy с дополнительными проверками
- Fuzzy matcher для Go автодополнения

### 2. Язык-специфичные плагины (lang-specific.lua)

#### Rust:
- **rustaceanvim**: продвинутая интеграция с rust-analyzer
  - `<leader>ra` - code actions
  - `<leader>rd` - debuggables
  - `<leader>rr` - runnables
  - `<leader>rt` - testables
- **crates.nvim**: управление зависимостями Cargo.toml

#### Go:
- **go.nvim**: полная интеграция с gopls
  - Автоматическое управление импортами
  - DAP поддержка из коробки
  - Code lens для тестов

#### TypeScript/JavaScript:
- **typescript-tools.nvim**: быстрая альтернатива tsserver
  - Separate diagnostic server
  - Полные inlay hints

#### C/C++:
- **clangd_extensions.nvim**: расширенная функциональность clangd
  - AST viewer
  - Memory layout viewer

### 3. DAP отладка (dap-config.lua)

Полная настройка отладчика для всех языков:
- **Rust/C/C++**: CodeLLDB adapter
- **Go**: Delve debugger
- **TypeScript/JavaScript**: js-debug-adapter

#### UI улучшения:
- **nvim-dap-ui**: красивый интерфейс отладчика
- **nvim-dap-virtual-text**: показ значений переменных inline

#### Горячие клавиши:
- `<leader>db` - toggle breakpoint
- `<leader>dc` - continue
- `<leader>di/o/O` - step into/over/out
- `<leader>du` - toggle debugger UI

### 4. Markdown улучшения (markdown-preview.lua)

- **markdown-preview.nvim**: live preview в браузере
- **render-markdown.nvim**: рендеринг в буфере
  - Красивые заголовки с иконками
  - Styled code blocks
  - Таблицы
  - Checkboxes
  - Callouts (NOTE, TIP, WARNING, etc.)
- **bullets.vim**: автоматические списки и чекбоксы

#### Горячие клавиши:
- `<leader>mp` - открыть preview
- `<leader>mt` - toggle preview

### 5. Treesitter (treesitter.lua)

#### Добавлены парсеры:
- gomod, gosum, gowork (Go ecosystem)
- jsdoc (JavaScript documentation)
- proto, cmake, make
- jsonc (JSON with comments)

#### Text objects:
- `af/if` - function outer/inner
- `ac/ic` - class outer/inner
- `aa/ia` - parameter outer/inner
- `]f/[f` - next/previous function
- `<leader>a/A` - swap parameters

#### Дополнительно:
- **treesitter-context**: показ контекста функции в header

### 6. Форматирование и линтинг (none-ls.lua, mason.lua)

#### Rust:
- rustfmt (--edition=2021)

#### Go:
- gofmt, goimports-reviser
- golines (макс. 120 символов)
- golangci-lint

#### C/C++:
- clang-format

#### TypeScript/JavaScript:
- prettierd (быстрая версия prettier)
- eslint_d (только если есть .eslintrc)
- biome (только если есть biome.json)

#### Markdown:
- markdownlint
- markdown-toc

#### Shell:
- shfmt, shellcheck

### 7. Дополнительные плагины (user.lua)

- **gitsigns**: git интеграция с blame
- **trouble.nvim**: красивый список диагностик
- **todo-comments**: подсветка TODO, FIXME, NOTE и т.д.
- **Comment.nvim**: умное комментирование с treesitter
- **nvim-surround**: работа с окружениями (скобки, кавычки)
- **nvim-autopairs**: автозакрытие скобок
- **which-key**: подсказки горячих клавиш

### 8. Автокоманды и настройки (polish.lua)

#### Язык-специфичные настройки:
- **Rust**: 4 spaces, colorcolumn=100
- **C/C++**: 4 spaces, colorcolumn=80
- **Go**: tabs (expandtab=false), colorcolumn=120
- **TypeScript/JavaScript**: 2 spaces, colorcolumn=100
- **Markdown**: wrap, spell, conceallevel=2

#### Оптимизация производительности:
- updatetime=250 (быстрее LSP)
- timeoutlen=300 (быстрее which-key)
- scrolloff=8 (контекст при скроллинге)
- pumheight=10 (компактное меню автодополнения)

#### Автоформатирование:
- При сохранении файла (BufWritePre)
- Highlight при копировании (yank)

## 📦 Установка

После обновления конфигурации запустите:

```bash
nvim
# Дождитесь установки плагинов через Lazy.nvim
:MasonInstall  # Установятся все необходимые LSP серверы и инструменты
```

## 🎯 Полезные команды

### Общие:
- `<leader>ff` - find files
- `<leader>fw` - find word
- `<leader>ld` - show diagnostics

### LSP:
- `gd` - go to definition
- `gr` - find references
- `K` - hover documentation
- `<leader>lh` - toggle inlay hints
- `<leader>la` - code action

### Debugger:
- `<leader>db` - breakpoint
- `<leader>dc` - start/continue
- `<leader>du` - toggle UI

### Git:
- `]c/[c` - next/prev hunk (gitsigns)
- `<leader>gh` - preview hunk

## 🔧 Кастомизация

Все настройки можно изменить в соответствующих файлах:
- `lua/plugins/astrolsp.lua` - LSP
- `lua/plugins/lang-specific.lua` - язык-специфичные плагины
- `lua/plugins/dap-config.lua` - отладка
- `lua/polish.lua` - автокоманды и общие настройки
