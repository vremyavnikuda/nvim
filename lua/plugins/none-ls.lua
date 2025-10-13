---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local status, null_ls = pcall(require, "null-ls")
    if not status then return opts end

    if not opts.sources then opts.sources = {} end

    local sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd.with {
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "json", "markdown", "yaml", "html", "css" },
      },
      null_ls.builtins.formatting.clang_format.with {
        filetypes = { "c", "cpp", "cuda" },
      },
      null_ls.builtins.formatting.gofmt,
      null_ls.builtins.formatting.goimports_reviser,
      null_ls.builtins.formatting.golines.with {
        extra_args = { "--max-len=120", "--base-formatter=gofumpt" },
      },
      null_ls.builtins.diagnostics.golangci_lint.with {
        extra_args = { "--fast" },
      },
      null_ls.builtins.formatting.rustfmt.with {
        extra_args = { "--edition=2021" },
      },
      null_ls.builtins.diagnostics.eslint_d.with {
        condition = function(utils)
          return utils.root_has_file { ".eslintrc.js", ".eslintrc.json", ".eslintrc", "eslint.config.js" }
        end,
      },
      null_ls.builtins.formatting.biome.with {
        condition = function(utils)
          return utils.root_has_file { "biome.json", "biome.jsonc" }
        end,
      },
      null_ls.builtins.diagnostics.markdownlint.with {
        filetypes = { "markdown" },
      },
      null_ls.builtins.formatting.shfmt.with {
        extra_args = { "-i", "2", "-ci" },
      },
      null_ls.builtins.diagnostics.shellcheck,
    }

    for _, source in ipairs(sources) do
      table.insert(opts.sources, source)
    end

    return opts
  end,
}
