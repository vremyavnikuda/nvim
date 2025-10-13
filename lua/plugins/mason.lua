---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "clangd",
        "gopls",
        "ts_ls",
        "marksman",
        "taplo",
        "jsonls",
        "yamlls",
        "bashls",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "prettier",
        "prettierd",
        "clang-format",
        "gofmt",
        "goimports",
        "goimports-reviser",
        "golines",
        "golangci-lint",
        "rustfmt",
        "eslint_d",
        "biome",
        "markdownlint",
        "markdown-toc",
        "shfmt",
        "shellcheck",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "codelldb",
        "delve",
        "js-debug-adapter",
        "cpptools",
      },
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    },
  },
}
