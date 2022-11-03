local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.autopep8,
		formatting.gofmt,
		formatting.blue,
		formatting.isort,
		diagnostics.flake8,
		diagnostics.codespell,
	},

	on_attach = function(client, bufnr)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

			-- format on save
			vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
		end

		if client.resolved_capabilities.document_range_formatting then
			vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
		end
	end,
})
