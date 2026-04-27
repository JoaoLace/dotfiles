return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim', -- já no kickstart
    'nvim-treesitter/nvim-treesitter', -- já no kickstart
  },
  opts = {
    workspaces = {
      {
        name = 'main',
        path = '/home/joao/Obsidian-Vault/', -- ajusta pro caminho do teu vault
      },
      -- se tiver vault separado pra faculdade:
      -- { name = "uemg", path = "~/vaults/uemg" },
    },

    -- Pasta de notas diárias
    daily_notes = {
      folder = 'Daily',
      date_format = '%Y-%m-%d',
      template = 'daily.md', -- opcional
    },

    -- Pasta de templates
    templates = {
      folder = '99 - Meta/00 - Templates',
    },

    -- Completion com [[wikilinks
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },

    legacy_commands = false,
    -- UI
    ui = {
      enable = true,
      checkboxes = {
        [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
        ['x'] = { char = '', hl_group = 'ObsidianDone' },
        ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
      },
      bullets = { char = '•', hl_group = 'ObsidianBullet' },
    },

    -- Formato dos novos arquivos de nota
    note_id_func = function(title)
      local suffix = ''
      if title ~= nil then
        suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. '-' .. suffix
    end,
  },

  config = function(_, opts)
    require('obsidian').setup(opts)

    -- Keymaps
    vim.keymap.set('n', '<leader>on', '<cmd>Obsidian new<CR>', { desc = '[O]bsidian [N]ew note' })
    vim.keymap.set('n', '<leader>oo', '<cmd>Obsidian open<CR>', { desc = '[O]bsidian [O]pen no app' })
    vim.keymap.set('n', '<leader>of', '<cmd>Obsidian quick_switch<CR>', { desc = '[O]bsidian [F]ind nota' })
    vim.keymap.set('n', '<leader>og', '<cmd>Obsidian search<CR>', { desc = '[O]bsidian [G]rep vault' })
    vim.keymap.set('n', '<leader>od', '<cmd>Obsidian today<CR>', { desc = '[O]bsidian nota [D]iária' })
    vim.keymap.set('n', '<leader>ob', '<cmd>Obsidian backlinks<CR>', { desc = '[O]bsidian [B]acklinks' })
    vim.keymap.set('n', '<leader>ot', '<cmd>Obsidian template<CR>', { desc = '[O]bsidian [T]emplate' })
    vim.keymap.set('n', '<leader>ow', '<cmd>Obsidian workspace<CR>', { desc = '[O]bsidian [W]orkspace' })
    vim.keymap.set('n', '<leader>ol', '<cmd>Obsidian follow_link<CR>', { desc = '[O]bsidian seguir [L]ink' })
    vim.keymap.set('n', 'gf', function()
      if require('obsidian').util.cursor_on_markdown_link() then
        return '<cmd>vim.ui.open<CR>'
      else
        return 'gf'
      end
    end, { noremap = false, expr = true })
  end,
}
