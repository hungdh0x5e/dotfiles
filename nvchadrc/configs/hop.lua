local present, hop = pcall(require, "hop")

if not present then
	return
end

hop.setup({
	keys = "etovxqpdygfblzhckisuran",
	case_insensitive = true,
	jump_on_sole_occurrence = true,
	create_hl_autocmd = true,
	uppercase_labels = false,
})

