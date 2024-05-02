return {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nord").setup({
            terminal_colors = false,
            borders = true,
            diff = { mode = "fg" },
            errors = { mode = "bg" },
            on_highlights = function(hl, c)
                local custom = {
                    gray0 = "#292e38",
                    gray1 = "#2B303B",
                }

                -- stylua: ignore start
                hl["Title"] =                   { fg = c.polar_night.light, bg = custom.gray0 }
                hl["StatusLineNC"] =            { bg = c.polar_night.origin, fg = c.polar_night.origin }
                hl["StatusLine"] =              { bg = c.polar_night.origin }

                hl["Selection"] =               { bg = c.polar_night.bright }
                hl["FloatNormal"] =             { bg = custom.gray0 }
                hl["FloatBorder"] =             { bg = custom.gray0, fg = custom.gray0 }
                hl["FloatNormalLight"] =        { bg = custom.gray1 }
                hl["FloatBorderLight"] =        { bg = custom.gray1, fg = custom.gray1 }

                hl["Pmenu"] =                   { link = "FloatNormal" }
                hl["PmenuSel"] =                { link = "Selection" }
                hl["NormalFloat"] =             { link = "FloatNormal" }

                hl["TelescopeNormal"] =         { link = "FloatNormal" }
                hl["TelescopeBorder"] =         { link = "FloatBorder" }
                hl["TelescopeTitle"] =          { link = "Title" }
                hl["TelescopePromptNormal"] =   { bg = c.polar_night.bright }
                hl["TelescopePromptBorder"] =   { bg = c.polar_night.bright, fg = c.polar_night.bright }
                hl["TelescopePromptTitle"] =    { bg = c.polar_night.bright, fg = c.polar_night.light }
                hl["TelescopeResultsNormal"] =  { link = "FloatNormalLight" }
                hl["TelescopeResultsBorder"] =  { link = "FloatBorderLight" }
                hl["TelescopePreviewNormal"] =  { link = "FloatNormal" }
                hl["TelescopePreviewBorder"] =  { link = "FloatBorder" }
                hl["TelescopeSelection"] =      { bg = c.polar_night.bright }
                hl["TelescopeMultiIcon"] =      { fg = c.aurora.yellow }
                hl["TelescopeMultiSelection"] = { fg = c.aurora.yellow }

                hl["CmpCursorLine"] =           { link = "Selection" }
                hl["CmpNormal"] =               { link = "FloatNormal" }
                hl["CmpDocsNormal"] =           { link = "FloatNormalLight" }
                hl["CmpDocsBorder"] =           { link = "FloatBorderLight" }

                hl["FixmeSeverityError"] =      { fg = c.aurora.red }
                hl["FixmeSeverityWarn"] =       { fg = c.aurora.yellow }
                hl["FixmeSeverityInfo"] =       { fg = c.frost.ice }
                hl["FixmeSeverityHint"] =       { fg = c.frost.artic_water }
                hl["FixmeFilepath"] =           { link = "Directory" }
                hl["FixmeText"] =               { fg = c.snow_storm.origin }

                hl["MiniHipatternsTodo"] =      { bg = c.frost.ice, fg = c.polar_night.origin }
                hl["MiniHipatternsRefactor"] =  { bg = c.aurora.yellow, fg = c.polar_night.origin }
                hl["MiniHipatternsFixme"] =     { bg = c.aurora.red, fg = c.snow_storm.origin }
                hl["MiniHipatternsTestme"] =    { bg = c.aurora.purple, fg = c.polar_night.origin }
                hl["MiniHipatternsRemoveme"] =  { bg = c.aurora.orange, fg = c.polar_night.origin }
                -- stylua: ignore end
            end,
        })
        vim.cmd.colorscheme("nord")
    end,
}
