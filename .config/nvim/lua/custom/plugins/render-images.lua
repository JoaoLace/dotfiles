return {
  '3rd/image.nvim',
  config = function()
    require('image').setup {
      backend = 'kitty',
      processor = 'magick_cli',
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
        },
      },
      max_width = 80,
      max_height = 20,
    }
  end,
}
