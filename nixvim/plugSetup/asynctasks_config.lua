-- Define a Lua function to accept the Vimscript dictionary
local function my_toggleterm(opts)
    -- Simulate running the command (e.g., with toggleterm)
    require'toggleterm'.exec(string.format("cd %s && %s", opts.cwd, opts.cmd))
end

-- Register the function globally
_G.my_toggleterm = my_toggleterm

vim.api.nvim_exec([[
	function! s:my_toggleterm(opts)
		call luaeval('my_toggleterm(_A)', a:opts)
	endfunction
	
	let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
	let g:asyncrun_runner.my_toggleterm = function('s:my_toggleterm')
]], false)
