#!/usr/bin/env -S nvim -l

vim.opt.runtimepath:append('.')

-- needed on CI
vim.fn.mkdir(vim.fn.stdpath('cache'), 'p')

local done = false
require('nvim-treesitter.install').install(
  'all',
  { force = true, generate = _G.arg[1] == 'generate' },
  function()
    done = true
  end
)

vim.wait(6000000, function()
  return done
end)
