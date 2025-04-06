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
    {
      '<Leader>hf',
      function()
        require('custom/plugins/format-hunks').format_hunks()
      end,
      mode = 'n',
      desc = '[H]unks [F]ormat'
    }
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
      ruby = { 'standardrb', lsp_fallback = true },
      css = { 'prettierd' },
      html = { 'prettierd', 'erb-formatter' },
      php = { 'phpcbf', 'pretty-php' },
      -- javascript = { 'prettierd', 'prettier' },
      -- javascript = { 'prettier' },
    },
    formatters = {
      standardrb = {
        command = "/Users/tomasz/.rbenv/shims/standardrb",
      }
  },
}
