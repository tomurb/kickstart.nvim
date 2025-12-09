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
      ruby = { 'standardrb', 'rubocop', lsp_fallback = true },
      css = { 'prettierd' },
      html = { 'prettierd', 'erb-formatter' },
      xml = { 'xmlformatter' },
      json = { 'prettierd' },
    },
    formatters = {
      standardrb = {
        command = "/Users/tomasz/.rbenv/shims/standardrb",
      }
    }
  },
}
