local function zenbones_highlights()
  vim.api.nvim_set_hl(0, 'NeoTreeNormal', { fg = '#bcbcbc', bg = 'none' })
  vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { fg = '#888888', bg = 'none' })
  vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = '#a0a0a0' })
  vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = '#a0a0a0' })
  vim.api.nvim_set_hl(0, 'NeoTreeFileName', { fg = '#c0c0c0' })
  vim.api.nvim_set_hl(0, 'NeoTreeFileIcon', { fg = '#909090' })
  vim.api.nvim_set_hl(0, 'NeoTreeIndentMarker', { fg = '#505050' })
  vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = '#d0d0d0' })
  vim.api.nvim_set_hl(0, 'NeoTreeGitAdded', { fg = '#808080' })
  vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = '#808080' })
  vim.api.nvim_set_hl(0, 'NeoTreeGitDeleted', { fg = '#808080' })
  vim.api.nvim_set_hl(0, 'Normal', { fg = '#e8e8e8', bg = '#0e0e0e' })
  vim.api.nvim_set_hl(0, 'Function', { fg = '#ffffff', bold = true })
  vim.api.nvim_set_hl(0, 'Keyword', { fg = '#ffffff', bold = true })
  vim.api.nvim_set_hl(0, 'Statement', { fg = '#cccccc' })
  vim.api.nvim_set_hl(0, 'Comment', { fg = '#666666', italic = true })
  vim.api.nvim_set_hl(0, 'String', { fg = '#ffffff' })
end

local themes = {
  {
    name = 'zenwritten',
    setup = function()
      vim.g.zenbones_transparent_background = true
      vim.cmd.colorscheme 'zenwritten'
      zenbones_highlights()
    end,
  },
  {
    name = 'tokyonight',
    setup = function() vim.cmd.colorscheme 'tokyonight' end,
  },
}

local function switch_theme()
  local names = vim.tbl_map(function(t) return t.name end, themes)
  vim.ui.select(names, { prompt = 'Escolha o tema:' }, function(choice)
    if not choice then return end
    for _, t in ipairs(themes) do
      if t.name == choice then
        t.setup()
        break
      end
    end
  end)
end

vim.keymap.set('n', '<leader>tt', switch_theme, { desc = 'Switch theme' })

return {
  {
    'mcchrish/zenbones.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    priority = 1000,
    lazy = false,
    config = function() themes[1].setup() end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
  },
}
