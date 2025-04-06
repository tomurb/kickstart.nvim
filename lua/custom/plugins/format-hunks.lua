local M = {}
local gitsigns = require 'gitsigns'

function M.format_hunks()
  local hunks = gitsigns.get_hunks(vim.api.nvim_get_current_buf()) or {}
  for _, hunk in ipairs(hunks) do
    local hunk_start = hunk['added']['start']
    local hunk_end = hunk_start + hunk['added']['count']

    local start_range = { hunk_start, 0 }
    local end_range = { hunk_end, string.len(hunk['added']['lines'][1]) }

    require('conform').format {
      lsp_fallback = true,
      range = {
        ['start'] = start_range,
        ['end'] = end_range
      }
    }
  end
end

return M
