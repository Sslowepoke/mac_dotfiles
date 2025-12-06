vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.winborder = "rounded"

local map = vim.keymap.set

vim.g.mapleader = " "
map('n', '<leader>o', ':update<CR>:source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')

map({ 'n', 'v', 'x' }, '<leader>y', '"+y')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d')
map({ 'n', 'v', 'x' }, '<leader>p', '"+p')
map({ 'n', 'v', 'x' }, '<leader>P', '"+P')
map({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')
map({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')

-- install plugins
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	-- { src = "https://github.com/neovim/nvim-lspconfig" },
	-- { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/github/copilot.vim.git" },
	{ src = "https://github.com/mason-org/mason.nvim.git" },
	-- { src = "https://github.com/saghen/blink.cmp.git" },
})


vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
-- vim.cmd("set completeopt+=noselect")


require "mini.pick".setup()
require "oil".setup()
require "mason".setup()
-- require "blink.cmp".setup(
-- 	{
-- 		dependencies = { 'rafamadriz/friendly-snippets' },
-- 		version = '1.*',
-- 		opts = {
-- 			keymap = { preset = 'default' },
--
-- 			appearance = {
-- 				nerd_font_variant = 'mono'
-- 			},
--
-- 			completion = { documentation = { auto_show = false } },
--
-- 			sources = {
-- 				default = { 'lsp', 'path', 'snippets', 'buffer' },
-- 			},
--
-- 			fuzzy = { implementation = "prefer_rust" }
-- 		},
-- 		opts_extend = { "sources.default" }
-- 	}
--
-- )


map('n', '<leader>f', ":Pick files<CR>")
map('n', '<leader>h', ":Pick help<CR>")
map('n', '<leader>e', ":Oil<CR>")
-- map('t', '^[', "^\^N") -- pojma nemam sta je
-- map('t', '^O', "^\^O")
map('n', '<leader>lf', vim.lsp.buf.format)

map('n', '<leader>c', ":Copilot enable<CR>")
map('n', '<leader>C', ":Copilot disable<CR>")

map('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false
})
vim.g.copilot_no_tab_map = true


vim.lsp.enable({ "lua_ls", "tinymist", "clangd", "basedpyright", "basedpyright-langserver" })

-- tabs?
map({ "n", "t" }, "<Leader>t", "<Cmd>tabnew<CR>")
map({ "n", "t" }, "<Leader>x", "<Cmd>tabclose<CR>")

map({ "n", "t" }, "<Leader>1", "1gt")
map({ "n", "t" }, "<Leader>2", "2gt")
map({ "n", "t" }, "<Leader>3", "3gt")
map({ "n", "t" }, "<Leader>4", "4gt")
map({ "n", "t" }, "<Leader>5", "5gt")
map({ "n", "t" }, "<Leader>6", "6gt")
map({ "n", "t" }, "<Leader>7", "7gt")
map({ "n", "t" }, "<Leader>8", "8gt")
map({ "n", "t" }, "<Leader>9", "9gt")
map({ "n", "t" }, "<Leader>0", "10gt")


-- colortheme
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
