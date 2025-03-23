local function format_hunks()
  local ignore_filetypes = { 'lua' }
  if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
    vim.notify('range formatting for ' .. vim.bo.filetype .. ' not working properly.')
    return
  end

  local hunks = require('gitsigns').get_hunks()
  -- vim.print(hunks)
  if hunks == nil then
    vim.print 'no hunks'
    return
  end

  local format = require('conform').format

  local function format_range()
    if next(hunks) == nil then
      -- vim.notify('done formatting git hunks', 'info', { title = 'formatting' })
      return
    end
    local hunk = nil
    while next(hunks) ~= nil and (hunk == nil or hunk.type == 'delete') do
      hunk = table.remove(hunks)
    end

    if hunk ~= nil and hunk.type ~= 'delete' then
      local start = hunk.added.start
      local last = start + hunk.added.count
      -- nvim_buf_get_lines uses zero-based indexing -> subtract from last
      local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
      local range = { start = { start, 0 }, ['end'] = { last - 1, last_hunk_line:len() } }
      format({ range = range, async = true, lsp_fallback = true }, function()
        vim.defer_fn(function()
          format_range()
        end, 1)
      end)
    end
  end

  format_range()
end
-- vim.api.nvim_create_user_command("FormatHunks", format_hunks, {})
vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, { command = 'silent write' })

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   desc = 'format after save and save after that if there were any changes',
--   -- group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
--   callback = function()
--     g- vim.notify 'debtu BufWrite'
--     local hunks = require('gitsigns').get_hunks()
--     if next(hunks) == nil then
--       vim.notify('debtu no hunks')
--     else
--       format_hunks()
--       vim.cmd('update')
--       -- vim.notify('formatted and saved')
--     end
--     -- vim.print(hunks)
--     -- vim.notify 'debtu'
--     -- vim.highlight.on_yank()
--   end,
-- })
return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      format_hunks,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    -- format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      -- local disable_filetypes = { c = true, cpp = true }
      -- return {
      --   -- timeout_ms = 500,
      --   lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      -- }
      -- format_hunks()
    -- end,
    -- format_after_save = function()
      -- format_hunks()
    -- end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- css = { 'stylelint' },
      ruby = { 'rubocop' },
      css = { 'prettierd' },
      html = { 'prettierd', 'erb-formatter' },
      php = { 'phpcbf', 'pretty-php' },
      -- javascript = { 'prettierd', 'prettier' },
      -- javascript = { 'prettier' },
    },
  },
}
