---@type LazySpec
return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    opts = {
      server = {
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "<leader>ra", function() vim.cmd.RustLsp "codeAction" end, { desc = "Rust Code Action", buffer = bufnr })
          vim.keymap.set("n", "<leader>rd", function() vim.cmd.RustLsp "debuggables" end, { desc = "Rust Debuggables", buffer = bufnr })
          vim.keymap.set("n", "<leader>rr", function() vim.cmd.RustLsp "runnables" end, { desc = "Rust Runnables", buffer = bufnr })
          vim.keymap.set("n", "<leader>rt", function() vim.cmd.RustLsp "testables" end, { desc = "Rust Testables", buffer = bufnr })
          vim.keymap.set("n", "K", function() vim.cmd.RustLsp { "hover", "actions" } end, { desc = "Rust Hover Actions", buffer = bufnr })
        end,
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              buildScripts = { enable = true },
            },
            checkOnSave = true,
            procMacro = {
              enable = true,
              ignored = {
                leptos_macro = { "component", "server" },
              },
            },
          },
        },
      },
      tools = {
        hover_actions = { auto_focus = true },
        inlay_hints = { auto = true },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
    end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      completion = {
        cmp = { enabled = true },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lsp_inlay_hints = {
        enable = true,
        only_current_line = false,
      },
      lsp_codelens = true,
      lsp_keymaps = false,
      diagnostic = {
        underline = true,
        virtual_text = { spacing = 2, prefix = "■" },
        signs = true,
      },
      dap_debug = true,
      dap_debug_gui = true,
    },
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        expose_as_code_action = "all",
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
        tsserver_format_options = {
          allowIncompleteCompletions = false,
          allowRenameOfImportPath = false,
        },
      },
    },
  },
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    opts = {
      inlay_hints = {
        inline = vim.fn.has "nvim-0.10" == 1,
        only_current_line = false,
        show_parameter_hints = true,
        parameter_hints_prefix = "<- ",
        other_hints_prefix = "=> ",
      },
      ast = {
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
    },
  },
}
