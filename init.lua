vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true

vim.opt.undofile = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {},
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs',
        opts = {
            ensure_installed = { 'asm', 'bash', 'c', 'cmake', 'cpp', 'css', 'csv', 'diff', 'dockerfile', 'gitignore', 'go', 'gomod', 'html', 'java', 'javascript', 'json', 'lua', 'luadoc', 'make', 'markdown', 'markdown_inline', 'python', 'toml', 'vim', 'vimdoc', 'yaml' },
            auto_install = true,
            highlight = {
                enable = true,
            },
        },
    },
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'tokyonight-night'
        end
    }
})
