-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<space><space>", function()
  require("telescope.builtin").find_files({
    search_dirs = { "~/.config", "~" },
    hidden = true,
    no_ignore = true,
  })
end, { desc = "Find files (including hidden in .config)", noremap = true, silent = true })
