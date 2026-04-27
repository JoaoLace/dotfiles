return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Set header
    dashboard.section.header.val = {
      [[                                                                     ]],
      [[       ███████████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      ████████████████ ███████████ ███   ███████     ]],
      [[     ████████████████ ████████████ █████ ██████████████   ]],
      [[    █████████████████████████████ █████ █████ ████ █████   ]],
      [[  ██████████████████████████████████ █████ █████ ████ █████  ]],
      [[ ██████  ███ █████████████████ ████ █████ █████ ████ ██████ ]],
      [[ ██████   ██  ███████████████   ██ █████████████████ ]],
      [[ ██████   ██  ███████████████   ██ █████████████████ ]],
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button('e', '  > New File', '<cmd>ene<CR>'),
      dashboard.button('f', ' > Find file', '<cmd>Telescope find_files<CR>'),
      dashboard.button('<C-n>', '  > Toggle file explorer', '<cmd>Neotree toggle<CR>'),
      dashboard.button('SPC ff', '󰱼 > Find File', '<cmd>Telescope find_files<CR>'),
      dashboard.button('SPC fw', '  > Find Word', '<cmd>Telescope live_grep<CR>'),
      dashboard.button('o', '󰆦  > Open Obsidian Vault', function()
        vim.cmd 'cd ~/Obsidian-Vault/'
        vim.cmd 'only' -- fecha todas as outras janelas
        vim.cmd 'Neotree focus'
      end),
      dashboard.button('c', '󰆦  > Open dotfiles', function()
        vim.cmd 'cd ~/.config/'
        vim.cmd 'only' -- fecha todas as outras janelas
        vim.cmd 'Neotree focus'
      end),
      dashboard.button('q', ' > Quit NVIM', '<cmd>qa<CR>'),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
    -- esconde bufferline no dashboard
    vim.api.nvim_create_autocmd('User', {
      pattern = 'AlphaReady',
      callback = function() vim.opt.showtabline = 0 end,
    })

    -- restaura ao sair do dashboard
    vim.api.nvim_create_autocmd('BufUnload', {
      buffer = 0,
      callback = function()
        if vim.bo.filetype == 'alpha' then vim.opt.showtabline = 2 end
      end,
    })
  end,
}
