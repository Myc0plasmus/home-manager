-- toggleterm

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	on_open = disable_esc_mapping,
	on_close = enable_esc_mapping,
	on_exit = enable_esc_mapping,
	count = 5
})

function _lazygit_toggle()
  lazygit:toggle()
end

function enable_esc_mapping(t)
	vim.keymap.set('t','<ESC>','<C-\\><C-N>')
end

function disable_esc_mapping(t)
	vim.keymap.set('t','<ESC>')
end


vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
