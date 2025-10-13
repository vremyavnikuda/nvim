
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        ["<Leader>d"] = { desc = "Debugger" },
        ["<Leader>db"] = { function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        ["<Leader>dB"] = { function() require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ") end, desc = "Conditional Breakpoint" },
        ["<Leader>dc"] = { function() require("dap").continue() end, desc = "Continue" },
        ["<Leader>di"] = { function() require("dap").step_into() end, desc = "Step Into" },
        ["<Leader>do"] = { function() require("dap").step_over() end, desc = "Step Over" },
        ["<Leader>dO"] = { function() require("dap").step_out() end, desc = "Step Out" },
        ["<Leader>dq"] = { function() require("dap").close() end, desc = "Close Session" },
        ["<Leader>dQ"] = { function() require("dap").terminate() end, desc = "Terminate" },
        ["<Leader>dp"] = { function() require("dap").pause() end, desc = "Pause" },
        ["<Leader>dr"] = { function() require("dap").restart_frame() end, desc = "Restart" },
        ["<Leader>dR"] = { function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
        ["<Leader>ds"] = { function() require("dap").run_to_cursor() end, desc = "Run To Cursor" },
        ["<Leader>du"] = { function() require("dapui").toggle() end, desc = "Toggle Debugger UI" },
        ["<Leader>dh"] = { function() require("dap.ui.widgets").hover() end, desc = "Debugger Hover" },

        ["<Leader>m"] = { desc = "Markdown" },
        ["<Leader>mp"] = { "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview" },
        ["<Leader>ms"] = { "<cmd>MarkdownPreviewStop<cr>", desc = "Stop Markdown Preview" },
        ["<Leader>mt"] = { "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview" },

        ["<Leader>lh"] = { function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, desc = "Toggle Inlay Hints" },
        
        ["K"] = { function() vim.lsp.buf.hover() end, desc = "Hover Documentation" },
        ["gd"] = { function() vim.lsp.buf.definition() end, desc = "Go to Definition" },
        ["gr"] = { function() vim.lsp.buf.references() end, desc = "Go to References" },
        ["gi"] = { function() vim.lsp.buf.implementation() end, desc = "Go to Implementation" },
        ["<Leader>D"] = { function() vim.lsp.buf.type_definition() end, desc = "Type Definition" },
      },
    },
  },
}
