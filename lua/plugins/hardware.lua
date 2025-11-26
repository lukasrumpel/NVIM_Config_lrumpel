return {
  -- 1. Füge Hardware-LSPs zu Mason hinzu
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "rust_hdl", -- VHDL LSP
        "verible",  -- Verilog LSP
        "asm-lsp",  -- Assembler LSP
      })
    end,
  },

  -- 2. Konfiguriere die LSPs
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- VHDL: HIER WAR DER FEHLER
        rust_hdl = {
          -- Wir definieren den Befehl explizit, damit "nil" nicht passiert
          cmd = { "vhdl_ls" },
          root_dir = require("lspconfig.util").root_pattern("vhdl_ls.toml"),
        },
        -- Verilog
        verible = {
          cmd = { "verible-verilog-ls", "--rules_config_search" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("verible.filelist", ".git")(fname) or vim.fn.getcwd()
          end,
        },
        -- Assembler
        asm_lsp = {
          filetypes = { "asm", "vmasm", "nasm" },
        },
      },
    },
  },

  -- 3. Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "vhdl",
          "verilog",
        })
      end
    end,
  },
}
