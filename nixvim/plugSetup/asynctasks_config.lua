vim.api.nvim_exec([[
	function! s:my_toggleterm(opts)
		echo a:opts['VIM_ROOT']
		echo a:opts['CMD']
	endfunction

	let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
	let g:asyncrun_runner.my_toggleterm = function('s:my_toggleterm')
]], false)
