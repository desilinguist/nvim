# Opinionated NeoVim Configuration

This repository contains my configuration files for the
[Neovim](https://neovim.io) editor.

## Introduction

The configuration is based primarily on my personal preferences and focused
mainly on the programming languages and tools that I use daily: Python,
Markdown, Bash, and Terraform.

## How to use

1. [Install Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim). I
   am a Mac user and use the excellent [macports](https://macports.org) to
   install Neovim as follows: `sudo port install neovim`.  To use
   [homebrew](https://brew.sh) instead of macports, run `brew install neovim`.

   This will install Neovim v0.7.2 which is the version that this configuration
   has been tested to work with. If you install an older or a newer release of
   Neovim, there is no guarantee that this configuration will work.

2. In your base conda directory, install the following packages: `black`,
   `flake8`, `isort`, and `pydocstyle`.

3. Use macports to install additional external packages:

   ```text
   sudo port install htop git lazygit ncdu nodejs18 npm7 ripgrep fd
   ```

   If you use homebrew, run
   ```text
    brew install htop git lazygit ncdu node@18 ripgrep fd
   ```

4. Clone this repository:

   ```
   git clone git@github.com:desilinguist/nvim.git ~/.config/nvim
   ```

   If you already use Neovim, make sure to remove or move your current
   `$HOME/.config/nvim` directory,

5. Modify line 21 in `$HOME/.config/nvim/lua/user/lsp/null-ls.lua` to change
   the path "/Users/nmadnani/anaconda/bin" to the absolute path for your base
   conda environment's `bin` directory.

6. If you used homebrew to install `lazygit` instead of macports, modify line
   53 in `lua/user/toggleterm.lua` to set `lazygit_dir` to the correct path for
   homebrew.

7. Run `nvim` and wait for all the plugins to be installed.


## Troubleshooting

If you have any issues or notice any error messages, run `:checkhealth` with
Neovim open to run health checks and report any issues it finds.

## A note on updating plugins

Most Neovim plugins are under heavy active development and are updated multiple
times a day. While this can be useful to get new features and bugfixes, it may
also sometimes break a working configuration since plugin authors usually
target nightly releases of Neovim. If you do not want to have to deal with
broken configurations, you have two options:

- Do not *ever* run `:PackerUpdate` or `:PackerSync` (mapped to the keyboard
  shortcut `Space + p + u`).

- Modify the file `$HOME/.config/nvim/lua/user/plugins.lua` to lock the plugins
  down after initial installation. To do so, simply add `lock=true` to all the
  `use` statements in that file, e.g., `use("hrsh7th/nvim-cmp", lock=True)`.

## Useful resources

The following resources will be extremely useful for any Neovim user.

- [Neovim-from-scratch](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ):
the excellent YouTube series on configuring Neovim, on which my configuration is almost entirely based.

- [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim)

- [/r/neovim](https://reddit.com/r/neovim)

- [Neovimcraft](https://neovimcraft.com)

- [Vim Cheatsheet](https://vim.rtorr.com)
