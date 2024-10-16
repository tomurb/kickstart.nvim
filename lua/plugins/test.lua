return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'zidhuss/neotest-minitest',
    'olimorris/neotest-rspec',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-rspec',
        require 'neotest-minitest' {
          dev = true,
        },
      },
    }
  end,
  keys = {
    { '<leader>n', '', desc = '+test' },
    { '<leader>nt', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = 'Run File' },
    { '<leader>nT', "<cmd>lua require('neotest').run.run(vim.uv.cwd())<CR>", desc = 'Run All Test Files' },
    { '<leader>nr', "<cmd>lua require('neotest').run.run()<CR>", desc = 'Run Nearest' },
    -- { "<leader>nl", function() require("neotest").run.run_last() end, desc = "Run Last" },
    { '<leader>nu', "<cmd>lua require('neotest').summary.toggle()<CR>", desc = 'Toggle Summary' },
    { '<leader>no', "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<CR>", desc = 'Show Output' },
    { '<leader>np', "<cmd>lua require('neotest').output_panel.toggle()<CR>", desc = 'Toggle Output [P]anel' },
    -- { "<leader>nS", function() require("neotest").run.stop() end, desc = "Stop" },
    -- { "<leader>nw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch" },
  },
}
  -- status = { virtual_text = true },
  -- output = { open_on_run = true },
  -- quickfix = {
  --   open = function()
  --     -- if LazyVim.has 'trouble.nvim' then
  --     --   require('trouble').open { mode = 'quickfix', focus = false }
  --     -- else
  --     vim.cmd 'copen'
  --     -- end
  --   end,
  -- },
  -- },

  -- config = function(_, opts)
  --   local neotest_ns = vim.api.nvim_create_namespace 'neotest'
  --   vim.diagnostic.config({
  --     virtual_text = {
  --       format = function(diagnostic)
  --         -- Replace newline and tab characters with space for more compact diagnostics
  --         local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
  --         return message
  --       end,
  --     },
  --   }, neotest_ns)
  --
  --   if opts.adapters then
  --     local adapters = {}
  --     for name, config in pairs(opts.adapters or {}) do
  --       if type(name) == 'number' then
  --         if type(config) == 'string' then
  --           config = require(config)
  --         end
  --         adapters[#adapters + 1] = config
  --       elseif config ~= false then
  --         local adapter = require(name)
  --         if type(config) == 'table' and not vim.tbl_isempty(config) then
  --           local meta = getmetatable(adapter)
  --           if adapter.setup then
  --             adapter.setup(config)
  --           elseif adapter.adapter then
  --             adapter.adapter(config)
  --             adapter = adapter.adapter
  --           elseif meta and meta.__call then
  --             adapter(config)
  --           else
  --             error('Adapter ' .. name .. ' does not support setup')
  --           end
  --         end
  --         adapters[#adapters + 1] = adapter
  --       end
  --     end
  --     opts.adapters = adapters
  --   end
  --
  --   require('neotest').setup(opts)
  -- end,
  -- stylua: ignore
