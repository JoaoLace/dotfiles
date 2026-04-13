return {
  'ej-shafran/compile-mode.nvim',
  version = '^5.0.0',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.g.compile_mode = {
      input_word_completion = true,
      use_pseudo_terminal = true,
      bang_expansion = true,
      recompile_no_fail = true,
      default_command = {
        c = 'cd %:h && gcc -o %:r %:t -lm',
        cpp = 'cd %:h && g++ -o %:r %:t -lm',
        python = 'python %',
      },
    }
  end,
}
