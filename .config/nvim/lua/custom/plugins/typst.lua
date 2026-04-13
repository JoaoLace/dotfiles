return {
  -- LSP do Typst
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tinymist = {
          settings = {
            formatterMode = 'typstyle',
            exportPdf = 'onSave',
          },
        },
      },
    },
  },

  -- Preview em tempo real
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '^1.0.0',
    build = function() require('typst-preview').update() end,
    opts = {},
  },
}
