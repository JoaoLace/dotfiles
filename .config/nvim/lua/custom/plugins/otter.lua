return {
  'jmbuhr/otter.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local otter = require 'otter'

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function() otter.activate({ 'typst' }, true, true) end,
    })
  end,
}
