--[[
  File: plugins.lua
  Description: This file needed for bootstraping packer.nvim and loading plugins
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/wbthomason/packer.nvim
]]

require("helpers/globals")
cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Mason {{{
  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate",
    requires = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("extensions/mason")
    end
  }
  -- }}}

  -- TreeSitter {{{
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("extensions/treesitter")
    end
  }
  -- }}}

  -- Telescope {{{
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = {
      {'nvim-lua/plenary.nvim'}
    },
    config = function()
      require("extensions/telescope")
    end
  }
  -- }}}

  -- Nvim Tree {{{
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("extensions/nvimtree")
    end
  }
  -- }}}
end)

-- vim: tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=1