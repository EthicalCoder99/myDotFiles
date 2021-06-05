-- change cwd to current directory
vim.cmd("cd %:p:h")
require("plugins._packer")
vim.cmd('colorscheme onedark')

-- load modules
require("modules._settings")
require("modules._utils")
require("modules._others")
-- require("modules._file_update_notif") -- Obsolete now.

-- load plugins
require("plugins._autopairs")
require("plugins._tmp_autopair_config")
require("plugins._quality_of_life_improvement")

-- TODO: 
-- Fix folds
-- Add treesitter
-- Add formatter
-- Add commenter
