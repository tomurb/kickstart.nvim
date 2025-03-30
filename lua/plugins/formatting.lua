return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- css = { 'stylelint' },
      ruby = { lsp_format = 'fallback' },
      css = { 'prettierd' },
      html = { 'prettierd', 'erb-formatter' },
      php = { 'phpcbf', 'pretty-php' },
      -- javascript = { 'prettierd', 'prettier' },
      -- javascript = { 'prettier' },
    },
  },
}
