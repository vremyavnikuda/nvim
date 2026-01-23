-- Minimal Neovim config for C/C++, Rust, and Go with VS Code-like theme.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

-- Core options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.termguicolors = true

require("lazy").setup({
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("kanagawa-wave")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 32 },
        renderer = { group_empty = true },
        filters = { dotfiles = false },
        actions = { open_file = { quit_on_open = false } },
      })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<c-\>]],
        direction = "float",
        float_opts = { border = "rounded" },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        scope = { enabled = true },
        indent = { char = "│" },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          c = { "astyle" },
          cpp = { "astyle" },
          h = { "astyle" },
          hpp = { "astyle" },
          rust = { "rustfmt" },
          go = { "gofmt" },
        },
        format_on_save = {
          timeout_ms = 2000,
          lsp_fallback = true,
        },
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({})
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({})
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({})
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neogit").setup({})
    end,
  },
})

-- Navigation keymaps
local map = vim.keymap.set
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
map("n", "<leader>t", "<cmd>Telescope<cr>", { desc = "Telescope menu" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<cr>", { desc = "Focus project tree" })
map("n", "<leader>E", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle project tree" })
map("n", "<leader>f", function()
  require("conform").format({ async = false, lsp_fallback = true })
end, { desc = "Format buffer" })
map("n", "]h", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next git hunk" })
map("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Prev git hunk" })
map("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })

-- Built-in LSP (Neovim 0.11+)
if vim.lsp and vim.lsp.config then
  vim.lsp.config("clangd", {})
  vim.lsp.config("rust_analyzer", {})
  vim.lsp.config("gopls", {})

  vim.lsp.enable({ "clangd", "rust_analyzer", "gopls" })
end
