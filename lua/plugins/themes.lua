return {
  -- 1. Installiere das Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- Wichtig: Lade es sofort beim Start
    priority = 1000, -- Wichtig: Lade es VOR allem anderen
  },

  -- 2. Sag LazyVim, dass dies das Standard-Theme ist
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
