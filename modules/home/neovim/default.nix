{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withRuby = false;
    withPython3 = false;

    extraPackages = with pkgs; [
      wl-clipboard
      ripgrep
      fd
    ];

    initLua = ''
      -- Basic Visuals
      vim.opt.number = true		-- Show line numbers
      vim.opt.relativenumber = true	-- Relative line numbers for easy jumping
      vim.opt.mouse = 'a'		-- Enale mouse support
      vim.opt.termguicolors = true	-- True color support

      -- Tabs & Indentation
      vim.opt.tabstop = 4
      vim.opt.shiftwidth = 4
      vim.opt.expandtab = true		-- Convert tabs to spaces
      vim.opt.smartindent = true

      -- Clipboard Synchronization with Wayland
      vim.opt.clipboard = 'unnamedplus'

      -- Keymaps
      vim.g.mapleader = ' '		-- Spacebar as your leader key
      vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = "Open File Explorer" })
    '';
  };
}
