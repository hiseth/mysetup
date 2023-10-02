local bff_status, bff_line = pcall(require, "bufferline")
if not bff_status then
	return
end

bff_line.setup({
	options = {
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				highlight = "Directory",
			},
		},
	},
})
