vim.cmd [[packadd packer.nvim]]

local ok, packer = pcall(require, "packer")

if ok then
    local use = packer.use
    packer.init({
        git = {
            clone_timeout = 300 -- 5 minutes, I have horrible internet
        },
        display = {open_cmd = '80vnew [packer]'}
    })

    local plugins = function()
        use {'wbthomason/packer.nvim', opt = true} -- plugin manager
        use {'joshdick/onedark.vim', opt = false} -- color theme
        use {'windwp/nvim-autopairs', opt = true} -- autopairs brackets, braces etc
        use {'norcalli/nvim-colorizer.lua', opt = true} -- colorize hex/rgb/hsl value
        use {'nvim-lua/popup.nvim'}
        use {'nvim-lua/plenary.nvim'}
    end

    packer.startup(plugins)
end
