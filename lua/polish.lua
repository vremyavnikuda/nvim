vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.conceallevel = 2
vim.opt.cmdheight = 1
vim.opt.pumheight = 10

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local rust_group = augroup("RustSettings", { clear = true })
autocmd("FileType", {
  pattern = "rust",
  group = rust_group,
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
    vim.opt_local.colorcolumn = "100"
  end,
})

local c_cpp_group = augroup("CCppSettings", { clear = true })
autocmd("FileType", {
  pattern = { "c", "cpp", "h", "hpp" },
  group = c_cpp_group,
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
    vim.opt_local.colorcolumn = "80"
  end,
})

local go_group = augroup("GoSettings", { clear = true })
autocmd("FileType", {
  pattern = "go",
  group = go_group,
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false
    vim.opt_local.colorcolumn = "120"
  end,
})

local ts_group = augroup("TypeScriptSettings", { clear = true })
autocmd("FileType", {
  pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  group = ts_group,
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt_local.colorcolumn = "100"
  end,
})

local md_group = augroup("MarkdownSettings", { clear = true })
autocmd("FileType", {
  pattern = "markdown",
  group = md_group,
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
    vim.opt_local.conceallevel = 2
    vim.opt_local.linebreak = true
  end,
})

local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = highlight_group,
  pattern = "*",
  callback = function() vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 } end,
})

local format_group = augroup("AutoFormat", { clear = true })
autocmd("BufWritePre", {
  group = format_group,
  pattern = "*",
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})

vim.filetype.add {
  extension = {
    mdx = "markdown",
  },
}
