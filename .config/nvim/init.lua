-- ==========================================================
-- FASTIK NEOVIM
-- ==========================================================

vim.g.mapleader = " "

-- ==========================================================
-- EDITOR
-- ==========================================================

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

vim.opt.signcolumn = "yes"

vim.opt.wrap = false

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.mouse = "a"

vim.opt.clipboard = "unnamedplus"

vim.opt.updatetime = 250

vim.opt.timeoutlen = 400


-- ==========================================================
-- COLORS
-- ==========================================================

local c = {
    bg = "#222530",
    surface = "#303442",

    fg = "#e6e7eb",
    muted = "#9aa0ad",

    blue = "#8aadf4",
    purple = "#c6a0f6",
    cyan = "#8bd5ca",

    green = "#a6da95",
    red = "#ed8796",
    yellow = "#eed49f",
}


vim.api.nvim_set_hl(0, "Normal", {
    fg = c.fg,
    bg = c.bg
})


vim.api.nvim_set_hl(0, "NormalFloat", {
    fg = c.fg,
    bg = c.surface
})


vim.api.nvim_set_hl(0, "CursorLine", {
    bg = c.surface
})


vim.api.nvim_set_hl(0, "LineNr", {
    fg = c.muted
})


vim.api.nvim_set_hl(0, "CursorLineNr", {
    fg = c.blue,
    bold = true
})


vim.api.nvim_set_hl(0, "Visual", {
    fg = c.bg,
    bg = c.blue
})


vim.api.nvim_set_hl(0, "Search", {
    fg = c.bg,
    bg = c.yellow
})


vim.api.nvim_set_hl(0, "IncSearch", {
    fg = c.bg,
    bg = c.purple
})


vim.api.nvim_set_hl(0, "StatusLine", {
    fg = c.fg,
    bg = c.surface
})


vim.api.nvim_set_hl(0, "VertSplit", {
    fg = c.surface
})


-- ==========================================================
-- KEYBINDS
-- ==========================================================

local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<CR>")

map("n", "<leader>q", "<cmd>q<CR>")

map("n", "<leader>e", "<cmd>Ex<CR>")

map("n", "<leader>t", "<cmd>terminal<CR>")

map("n", "<Esc>", "<cmd>nohlsearch<CR>")


-- Window navigation

map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")


-- ==========================================================
-- C / C++
-- ==========================================================

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "c",
        "cpp",
        "h",
        "hpp"
    },

    callback = function()

        vim.opt_local.tabstop = 2

        vim.opt_local.shiftwidth = 2

        vim.opt_local.expandtab = true

    end
})