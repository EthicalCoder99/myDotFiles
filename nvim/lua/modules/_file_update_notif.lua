-- Obsolete now. Functionality added in ../plugin/_quality_of_life_improvement.lua
local cmd = vim.api.nvim_exec

-- trigger `autoread` when files changes on disk
cmd([[
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
  autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
  ]], false)
-- notification after file change
