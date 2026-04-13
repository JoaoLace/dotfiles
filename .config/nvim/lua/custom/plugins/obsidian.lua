return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = 'personal',
        path = '~/Obsidian-Vault/',
      },
    },
    daily_notes = {
      folder = '06 - Daily',
      date_format = '%Y%m%d',
    },
    templates = {
      folder = '99 - Meta/00 - Templates',
    },
  },
}
