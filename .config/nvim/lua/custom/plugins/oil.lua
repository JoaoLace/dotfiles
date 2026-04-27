return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      keymaps = {
        ['q'] = 'actions.close',
      },
    }

    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = 'oil://*',
      callback = function()
        local dir = require('oil').get_current_dir()
        if dir then vim.cmd('cd ' .. dir) end
      end,
    })

    vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open Oil' })
    vim.keymap.set('n', '<leader>nc', '<cmd>Oil ~/.config/nvim<CR>', { desc = 'Nvim config' })
  end,
}
