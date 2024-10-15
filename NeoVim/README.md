# Pre-Requisites

**WARNING**: Follow this before running the `deploy.sh` script

Most pre-requisites are handled by the `deploy.sh` script, however the below need to be done manually

## NerdFonts

Download a nerd font from <https://github.com/ryanoasis/nerd-fonts/tree/master?tab=readme-ov-file#patched-fonts>

### Ubuntu/Debian

1. Download font
2. Move to `~/.local/share/fonts`
3. Run `fc-cache -f -v`
4. Open terminal settings and change the default font face
5. Close and re-open terminal to activate the font

### WSL

1. On Windows, navigate to [GitHub NerdFonts - Patched Fonts](https://github.com/ryanoasis/nerd-fonts/tree/master?tab=readme-ov-file#patched-fonts ) and download a font of your choice.
    1. _Jetbrains mono is good_
2. Once downloaded, open the `font.ttf`. A window should open. Click `install` in the top-left hand corner.
3. Now that the font is downloaded, you can update it for your WSL instance
4. Open `settings` and change the default font face.
5. Now close and re-open the WSL window to activate the font

**WARNING**: Just setting the font for WSL doesn't seem to take effect. Might need it in the PowerShell window too

# Tips

- Search key maps with `space-s-k`, i.e. `space-s-k new tab`
  - Or show what's mapped to a key with `:verbose map <key>`
- The `?` key is your friend. It will show you the keybindings for the current mode.
- It is recommended to run `:LazyHealth` after installation. This will load all plugins and check if everything is working correctly.
- Hotkeys: <https://www.lazyvim.org/keymaps#general>
- There are 3 types of windows. From smallest to largest:
  - Windows: Separate panes
  - Buffer: Can have multiple buffers in a window's space that you can switch between
  - Tabs: As you'd expect
- Experiment with all the Telescope search options (`space-s-...`). They are very powerful!
- If you want to quickly change the current working directory for your tab:
  1. In NeoTree, move your cursor over the directory you want to change to
  2. Press `Y` (Shift + y) to copy the path
  3. Press `:tchdir` and `Shift + Insert` to paste the path
- Select all instances of a word with `*` (normal mode) and then `gn` to select the next instance
- Cancel auto-complete with `Ctrl-e` (insert mode)

## Projects

- This is an extra plugin from `:LazyExtras` (util.project)
- By default, `manual_mode = true` meaning it won't automatically detect projects
- To add a project, `:cd` to your dir, and run `:AddProject`
- To search and open a project `space-f-p` (This is bound to `:Telescope projects`)
  - This is a fuzzy search, so you can type in parts of the project name
- To delete a project, when in the search project window, `Ctrl-d`

## Marks

- set a mark with `m` followed by a letter, i.e. `ma`
  - You will see the mark in the gutter
- go to the mark with `'` (backtick) followed by the letter, i.e. `'a`
- Delete the marks with `:delm! | delm A-Z0-9`, then force the Shada write `:wshada!`

## Coding workflow

- Show symbols (i.e. functions) with `space-s-s`
  - This uses Telescope's symbols plugin
- TODO: Refactoring, change all instances of variable name

## Terminal

- Split-open the terminal with `:[v]sp +term`

# Extra Plugins

Install extra plugins by running `:LazyExtras` and pressing `x` on the plugins you want to enable (requires restart of Nvim)

## Favourite Extra Plugins

|Name | Description |
|---|---|
|Copilot | LLM code completion |
|Aerial | File tree / symbol browser in a new sidebar |
|util.project  | Project management. See tips section above |


# Troubleshooting

## Neovim version too old

Usually happens in non bleeding-edge distributions (i.e. Ubuntu LTS)

1. Uninstall existing neovim package
2. Install latest neovim appimage from: <https://github.com/neovim/neovim/releases>
3. Set execute permissions on it and place in your path somewhere (rename to `nvim`)

## Plugins not loading

Run `:LazyHealth`. This will load all plugins as well as giving you a health report.

## Find-Files not working

1. Make sure `ripgrep` is installed. Should have installed with the `deploy.sh` script
2. Check the health of telescope with `:checkhealth telescope`
3. Try a different type of search: `:Telescope live_grep`
4. Find files search might also not work if you have too many files to search across. Try `:cd` to a smaller directory to see if it works

## LazyVim not initializing

Keep your config but go to `~/.local/share/` and delete the nvim folder, then restart your terminal, start `nvim` and it should load up lazyvim.

## Markdown-Preview not working, showing NodeJS version

1. Make sure `NodeJS` is installed
2. CD to `/home/user/.local/share/nvim/lazy/markdown-preview.nvim/app`
3. Run `./install.sh`
