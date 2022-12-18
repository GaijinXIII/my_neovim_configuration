local u = require("utils")
local opts = { noremap = true, silent = true }

require("hop").setup()

u.map("n", "F", ":HopWordMW<CR>", opts)
u.map("n", ";h", ":HopChar1MW<CR>", opts)
u.map("n", "<space>/", ":HopPatternMW<CR>", opts)
u.map("n", "<space>;", ":HopLineMW<CR>", opts)
