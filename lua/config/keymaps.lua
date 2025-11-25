-- In lua/config/keymaps.lua

-- Terminal unten öffnen mit F7
vim.keymap.set("n", "<F7>", function()
  require("snacks").terminal(nil, { win = { position = "bottom" } })
end, { desc = "Terminal unten" })

-- Schwebendes Terminal mit Strg+t
vim.keymap.set({"n", "t"}, "<C-t>", function()
  require("snacks").terminal()
end, { desc = "Float Terminal" })
