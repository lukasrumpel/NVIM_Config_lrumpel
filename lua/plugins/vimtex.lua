return {
  "lervag/vimtex",
  lazy = false, -- Don't lazy load VimTeX for better inverse-search functionality
  -- You can optionally pin to a specific version with:
  -- tag = "v2.15",
  init = function()
    -- VimTeX configuration goes here. Example:
    vim.g.vimtex_general_viewer = "okular"
  end,
}
