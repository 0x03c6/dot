local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git',
      'clone',
      '--depth',
      '1', 
      'https://github.com/wbthomason/packer.nvim',
      install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'akinsho/bufferline.nvim', tag = "v3.*", 
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use 'tiagovla/scope.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'navarasu/onedark.nvim'
  use 'nyoom-engineering/oxocarbon.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

