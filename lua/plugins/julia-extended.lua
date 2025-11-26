return {
  -- 1. LaTeX-zu-Unicode Support
  {
    "julialang/julia-vim",
    lazy = false,
  },

  -- 2. Debugging Support
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")

      -- Absoluter Pfad zum Environment
      local env_path = os.getenv("HOME") .. "/.julia/environments/v1.12"

      dap.adapters.julia = {
        type = "executable",
        command = "julia",
        args = {
          "--startup-file=no",
          "--history-file=no",
          "--project=" .. env_path,
          "-e",
          "import DebugAdapter; DebugAdapter.run()",
        },
      }

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
