return {
  'github/copilot.lua',
  config = function()
    require('copilot').setup({
      filetypes = {
        yaml = true,  -- enabling Copilot for generic YAML files
        ['yaml.ansible'] = true  -- specifically enabling for Ansible YAML
      }
    })

    -- Set keybinding for accepting Copilot suggestion to Ctrl + j
    -- Something is conflicting with the default keybinding in some modes
    vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false
    })
    vim.g.copilot_no_tab_map = true
  end,
}
