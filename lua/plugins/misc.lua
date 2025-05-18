-- Standalone plugins with less than 10 lines of config go here
return {
  {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },
  {
    -- Powerful Git integration for Vim
    'tpope/vim-fugitive',
  },
  {
    -- GitHub integration for vim-fugitive
    'tpope/vim-rhubarb',
  },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'github/copilot.vim',
    config = function()
      vim.keymap.set('n', '<leader>ec', ':Copilot enable<CR>', { desc = 'Enable Copilot', noremap = false, silent = true })
      vim.keymap.set('n', '<leader>dc', ':Copilot disable<CR>', { desc = 'Disable Copilot', noremap = false, silent = true })
      vim.keymap.set('i', '<C-g>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
        silent = true,
        noremap = true,
      })
      vim.g.copilot_no_tab_map = true
    end,
  },
}
