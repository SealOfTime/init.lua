vim.opt.rtp:append(vim.fn.stdpath "config" .. "/plugins/start/*")
vim.opt.rtp:append(vim.fn.stdpath "config" .. "/plugins/after/*")

vim.cmd[[set background=light]]
vim.cmd[[colorscheme PaperColor]]

vim.wo.number = true
vim.wo.relativenumber=true

vim.opt.expandtab=true
vim.opt.shiftwidth=4
vim.opt.tabstop=4
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>o", "o<esc>")
vim.keymap.set("n", "<leader>O", "O<esc>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.opt.completeopt = { "menu", "preview" }
vim.api.nvim_create_autocmd("CompleteDone", {
    callback = function(args) vim.cmd[[pclose]] end
})

-- Helps with NeoVim configuration and writing plugins
require("neodev").setup({})

local lspcfg = require("lspconfig")
lspcfg.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

local tscope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tscope.find_files, {})
vim.keymap.set('n', '<leader>fg', tscope.live_grep, {})
vim.keymap.set('n', '<leader>fb', tscope.buffers, {})
vim.keymap.set('n', '<leader>fh', tscope.help_tags, {})
