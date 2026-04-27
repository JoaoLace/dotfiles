-- adiciona como outro arquivo em lua/plugins/
return {
  'oflisback/obsidian-bridge.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('obsidian-bridge').setup {
      obsidian_server_address = '127.0.0.1:27123',
      scroll_sync = true,
      api_key = '109aa499981db9efd8c5957bf76985f3dfadff7c40c3ad550c94c0fcb424e602',
      open_note_in_obsidian_on_enter = false,
    }
  end,
  event = { 'BufReadPre *.md', 'BufNewFile *.md' },
  lazy = true,
}
