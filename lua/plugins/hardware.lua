return {
  -- 1. Füge Hardware-LSPs zu Mason hinzu (Installer)
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "rust_hdl", -- VHDL LSP
        "verible",  -- Verilog/SystemVerilog LSP & Linter
        "asm-lsp",  -- Assembler LSP
      })
    end,
  },

  -- 2. Konfiguriere die LSPs
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- VHDL
        rust_hdl = {
          -- Optional: cmd Pfad anpassen, falls manuell installiert
          -- cmd = {"vhdl_ls"},
        },
        -- Verilog / SystemVerilog
        verible = {
          cmd = { "verible-verilog-ls", "--rules_config_search" },
          root_dir = function(fname)
            -- Sucht nach einer verible.filelist oder .git
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

  -- 3. Syntax Highlighting (Treesitter) erweitern
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "vhdl",
          "verilog",
          "systemrdl", -- Oft nützlich für Hardware
        })
      end
    end,
  },

  -- 4. Filetype Association für SystemC und Assembler fixen
  {
    "nmac427/guess-indent.nvim", -- Optional, hilft bei wirren Einrückungen
    init = function()
      -- SystemC Header als C++ behandeln
      vim.filetype.add({
        extension = {
          h = "cpp",
          sc = "cpp",
        },
      })
    end,
  }
}
