local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

-- set concurrency based on the number of available CPUs
-- if that number is less than 4, set it to 1
-- otherwise set it to 4
local uv = require('luv')
local cpus = uv.available_parallelism()
local howconcurrent = cpus < 4 and 1 or 4

-- add actual plugins to ~/.config/nvim/lua/plugins/init.lua
local opts = {
    concurrency = howconcurrent,
}
require("lazy").setup("plugins", opts)
