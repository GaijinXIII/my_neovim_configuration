require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    -- commentStyle = "italic",
    commentStyle = "NONE",
    functionStyle = "NONE",
    -- keywordStyle = "italic",
    keywordStyle = "NONE",
    statementStyle = "bold",
    typeStyle = "NONE",
    -- variablebuiltinStyle = "italic",
    variablebuiltinStyle = "NONE",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    colors = {},
    overrides = {},
})