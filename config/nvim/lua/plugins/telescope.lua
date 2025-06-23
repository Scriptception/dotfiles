return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      hidden = true,
      file_ignore_patterns = {}, -- stop ignoring hidden dirs
      follow = true,             -- follow symlinks just in case
    },
    pickers = {
      find_files = {
        hidden = true,
        follow = true,
      },
    },
  },
}
