return {
  {
    'mcchrish/zenbones.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    priority = 1000,
    lazy = false,
    config = function()
      -- 🔹 ativa transparência do tema
      vim.g.zenbones_transparent_background = true

      -- 🔹 aplica o colorscheme
      vim.cmd.colorscheme 'zenwritten'

      -- 🔥 AUTOCMD: garante que nada sobrescreva depois
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = function()
          -- transparência global
          vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
          vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
          vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
          vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })

          -- 🔥 Neo-tree monocromático
          vim.api.nvim_set_hl(0, 'NeoTreeNormal', { fg = '#bcbcbc', bg = 'none' })
          vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { fg = '#888888', bg = 'none' })

          vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = '#a0a0a0' })
          vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = '#a0a0a0' })

          vim.api.nvim_set_hl(0, 'NeoTreeFileName', { fg = '#c0c0c0' })
          vim.api.nvim_set_hl(0, 'NeoTreeFileIcon', { fg = '#909090' })

          vim.api.nvim_set_hl(0, 'NeoTreeIndentMarker', { fg = '#505050' })
          vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = '#d0d0d0' })

          -- git sem cor (opcional, mais clean)
          vim.api.nvim_set_hl(0, 'NeoTreeGitAdded', { fg = '#808080' })
          vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = '#808080' })
          vim.api.nvim_set_hl(0, 'NeoTreeGitDeleted', { fg = '#808080' })
        end,
      })

      -- 🔹 aplica imediatamente (sem precisar reiniciar)
      vim.cmd 'doautocmd ColorScheme'
    end,
  },
}
