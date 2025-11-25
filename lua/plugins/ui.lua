 return {
  -- 1. TokyoNight Theme Konfiguration
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Theme muss beim Start sofort laden
    priority = 1000,
    opts = {
      style = "storm", -- Optionen: "storm", "moon", "night", "day"
      transparent = false, -- Setze auf true, wenn dein Terminal den Hintergrund machen soll
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  -- 2. LazyVim sagen, dass es TokyoNight nutzen SOLL
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },

  -- 3. Dateiexplorer (Neo-tree) Anpassung
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "left", -- Links andocken (Standard)
        width = 30,       -- Breite
      },
      filesystem = {
        filtered_items = {
          visible = true, -- Versteckte Dateien (dotfiles) anzeigen?
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    },
  },
}
