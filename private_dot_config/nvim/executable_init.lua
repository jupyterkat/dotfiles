
-- Globals

vim.g.mapleader = " "

vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

vim.g.base16colorspace = 256
vim.g.indent_blankline_filetype_exclude = {'dashboard'}
vim.g.indent_blankline_use_treesitter = true

vim.g.neovide_refresh_rate = 40
vim.g.neovide_cursor_antialiasing = false

vim.g.rustfmt_autosave = 1
vim.g.neo_tree_remove_legacy_commands = 1

-- Load things
-- impatient load is allowed to fail
pcall(require, 'impatient')
require('plugins')
require('lsp')

-- Ui settings

vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.guifont = "ComicCode Nerd Font:h12"
vim.opt.encoding = "utf-8"
vim.opt.undofile = true
vim.opt.fileformat = "unix"

vim.opt.fillchars = "eob:'"

vim.opt.showmode = false
vim.opt.wrap = false
vim.opt.foldenable = false
vim.opt.shortmess:append("c")

vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.updatetime = 300

vim.opt.printfont = ":h10"
vim.opt.printencoding = "utf-8"
vim.opt.printoptions = "paper:letter"
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.opt.scrolloff = 4

-- Tabs

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Search

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

-- Colorscheme

vim.cmd([[ 
hi Normal ctermbg=NONE
colorscheme monokai
]])

vim.opt.clipboard = "unnamed"

-- Bindings

vim.api.nvim_set_keymap('i', 'kj', '<esc>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>a', ':lua vim.diagnostic.open_float()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d', ':lua vim.diagnostic.goto_next()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':lua vim.lsp.buf.hover()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>Telescope projects<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })

