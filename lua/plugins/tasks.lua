return {
  {
    "stevearc/overseer.nvim",
    opts = {
      strategy = { "toggleterm", direction = "horizontal" },
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
    keys = {
      { "<leader>tr", "<cmd>OverseerRun<cr>", desc = "Run Task" },
      { "<leader>tl", "<cmd>OverseerToggle<cr>", desc = "Task List" },
      {
        "<leader>tb",
        function()
          require("overseer").run_template({ tags = { "build" } })
        end,
        desc = "Build Task ausführen"
      },
    },
    config = function(_, opts)
      require("overseer").setup(opts)

      -- Template: C/C++ Kompilieren (Smart)
      require("overseer").register_template({
        name = "Compile C/C++ File",
        builder = function()
          local file = vim.fn.expand("%:p")
          local outfile = vim.fn.expand("%:p:r") -- Dateiname ohne Endung (z.B. 'main')
          local ft = vim.bo.filetype

          -- Wähle den richtigen Compiler
          local cmd = "g++"
          if ft == "c" then
            cmd = "gcc"
          end

          return {
            cmd = { cmd },
            args = { "-g", file, "-o", outfile },
            components = {
              { "on_output_quickfix", open = true },
              "default"
            },
          }
        end,
        condition = {
          -- HIER WAR DER FIX: Jetzt auch 'c' erlauben
          filetype = { "cpp", "c" },
        },
        tags = { "build" },
      })
    end,
  },
}
