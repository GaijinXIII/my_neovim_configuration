local present, wk = pcall(require, "which-key")

if not present then
	return
end

local u = require("utils")

local options = {
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		winblend = 0,
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	layout = {
		spacing = 6, -- spacing between columns
	},
}

wk.setup(options)

u.map("n", "<c-h>", "<cmd>WhichKey<CR>", { noremap = true, silent = true })