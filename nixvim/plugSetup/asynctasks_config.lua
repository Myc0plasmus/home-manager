vim.api.nvim_exec([[
	function! s:my_toggleterm(opts)
		echo a:opts
	endfunction

	let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
	let g:asyncrun_runner.test = function('s:my_toggleterm')
]])
