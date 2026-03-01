return {
  'vim-test/vim-test',
  -- config = function ()
  --   require('vim-test').setup()
  -- end,
  keys = {
    { '<leader>m' , '', desc = '+test' },
    { '<leader>mt' , '<cmd>TestNearest<cr>', desc = 'test nearest' },
    { '<leader>mT', '<cmd>TestFile<cr>', desc = 'test file' },
    { '<leader>ma', '<cmd>TestSuite<cr>', desc = 'test suite' },
    { '<leader>ml', '<cmd>TestLast<cr>', desc = 'test last' },
    { '<leader>mg', '<cmd>TestVisit<cr>', desc = 'test visit' },
  }
}
