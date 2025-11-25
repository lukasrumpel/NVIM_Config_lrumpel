return {
  -- 1. LaTeX-zu-Unicode Support
  {
    "julialang/julia-vim",
    lazy = false, -- HIER WAR DER FIX: Sofort laden, damit die Funktionen da sind!
    init = function()
        -- Optional: Deaktiviere Mapping in anderen Dateitypen, falls es nervt
        -- vim.g.latex_to_unicode_file_types = "julia"
    end,
  },

  -- 2. Debugging Support (Verbindet DAP mit Julia)
  {
    "mfussenegger/nvim-dap",
    dependencies = { "kdheepak/nvim-dap-julia" },
    opts = function()
      local dap = require("dap")

      -- Adapter Setup
      dap.adapters.julia = {
        type = "executable",
        command = "julia",
        args = {
          "--startup-file=no",
          "--history-file=no",
          "--project=@v#.#",
          "-e",
          "import DebugAdapter; DebugAdapter.run()",
        },
      }

      -- Configuration Setup
      dap.configurations.julia = {
        {
          type = "julia",
          request = "launch",
          name = "Run Julia File",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }
    end,
  },
}
