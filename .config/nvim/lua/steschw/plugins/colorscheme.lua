return {
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nord").setup({
                terminal_colors = false,
                borders = true,
                diff = { mode = "fg" },
                errors = { mode = "bg" },
                search = { theme = "vim" },
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
                    -- NOTE: prompt input line uses "CursorLine" highlight group
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
                    hl["FixmeColumnSeparator"] =    { link = "Comment" }
                    hl["QuickFixLine"] =            { bg = c.polar_night.brighter }

                    hl["MiniHipatternsTodo"] =      { bg = c.frost.ice, fg = c.polar_night.origin }
                    hl["MiniHipatternsRefactor"] =  { bg = c.aurora.yellow, fg = c.polar_night.origin }
                    hl["MiniHipatternsFixme"] =     { bg = c.aurora.red, fg = c.snow_storm.origin }
                    hl["MiniHipatternsTestme"] =    { bg = c.aurora.purple, fg = c.polar_night.origin }
                    hl["MiniHipatternsRemoveme"] =  { bg = c.aurora.orange, fg = c.polar_night.origin }

                    hl["FelineActive"] =              { bg = c.polar_night.bright }
                    hl["FelineInactive"] =            { bg = "#323946" } -- slightly darker c.polar_night.bright
                    hl["FelineFilenameActive"] =      { bg = c.frost.artic_ocean, fg = c.snow_storm.origin }
                    hl["FelineFilenameInactive"] =    { bg = c.polar_night.brightest, fg = c.snow_storm.origin }
                    hl["FelineLazyUpdatesActive"] =   { bg = c.frost.polar_water, fg = c.polar_night.origin }
                    hl["FelineLazyUpdatesInactive"] = { bg = c.frost.polar_water, fg = c.polar_night.origin }
                    hl["FelineSearchCountActive"] =   { bg = c.frost.ice, fg = c.polar_night.origin }
                    hl["FelineSearchCountInactive"] = { bg = c.frost.ice, fg = c.polar_night.origin }
                    hl["FelineFileChangesActive"] =   { bg = c.snow_storm.origin, fg = c.polar_night.origin }
                    hl["FelineFileChangesInactive"] = { bg = c.snow_storm.origin, fg = c.polar_night.origin }
                    hl["FelineGrappleActive"] =       { bg = c.frost.artic_water, fg = c.polar_night.origin }
                    hl["FelineGrappleInactive"] =     { bg = c.frost.artic_water, fg = c.polar_night.origin }
                    hl["FelineQfActive"] =            { bg = c.frost.artic_water, fg = c.polar_night.origin }
                    hl["FelineQfInactive"] =          { bg = c.polar_night.bright, fg = c.snow_storm.origin }
                    -- stylua: ignore end
                end,
            })
            -- vim.cmd.colorscheme("nord")
        end,
    },
    {
        "rose-pine/neovim",
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "auto",
                dark_variant = "moon",
                dim_inactive_windows = false,
                extend_background_behind_borders = false,
                enable = {
                    terminal = false,
                    legacy_highlights = true,
                    migrations = true,
                },
                styles = {
                    bold = false,
                    italic = false,
                    transparency = false,
                },
                highlight_groups = {
                    -- stylua: ignore start
                    Selection =                 { fg = "rose", reverse = true },
                    FloatNormal =               { bg = "surface" },
                    FloatBorder =               { bg = "surface", fg = "surface" },
                    FloatTitle =                { bg = "surface", fg = "foam" },
                    FloatFooter =               { bg = "surface", fg = "surface" },

                    Pmenu =                     { link = "FloatNormal" },
                    PmenuSel =                  { link = "Selection" },
                    NormalFloat =               { link = "FloatNormal" },

                    TelescopePreviewNormal =    { link = "FloatNormal" },
                    TelescopePreviewBorder =    { bg = "surface", fg = "base" },
                    TelescopePreviewTitle =     { bg = "overlay", fg = "text" },
                    TelescopeResultsNormal =    { link = "FloatNormal" },
                    TelescopeResultsBorder =    { bg = "surface", fg = "base" },
                    -- NOTE: prompt input line uses "CursorLine" highlight group,
                    TelescopePromptNormal =     { bg = "overlay" },
                    TelescopePromptBorder =     { bg = "overlay", fg = "gold" },
                    TelescopePromptTitle =      { bg = "overlay", fg = "foam" },
                    TelescopeMultiIcon =        { fg = "gold" },
                    TelescopeMultiSelection =   { fg = "gold" },
                    TelescopeMatching =         { fg = "rose", underline = true },

                    CmpCursorLine =             { link = "Selection" },
                    CmpNormal =                 { link = "FloatNormal" },
                    CmpBorder =                 { bg = "surface", fg = "base" },
                    CmpDocsNormal =             { link = "FloatNormal" },
                    CmpDocsBorder =             { bg = "surface", fg = "base" },

                    -- TODO:
                    -- FixmeSeverityError =        { fg = c.aurora.red },
                    -- FixmeSeverityWarn =         { fg = c.aurora.yellow },
                    -- FixmeSeverityInfo =         { fg = c.frost.ice },
                    -- FixmeSeverityHint =         { fg = c.frost.artic_water },
                    -- FixmeFilepath =             { link = "Directory" },
                    -- FixmeText =                 { fg = c.snow_storm.origin },
                    -- FixmeColumnSeparator =      { link = "Comment" },
                    -- QuickFixLine =              { bg = c.polar_night.brighter },

                    -- TODO:
                    -- MiniHipatternsTodo =        { bg = c.frost.ice, fg = c.polar_night.origin },
                    -- MiniHipatternsRefactor =    { bg = c.aurora.yellow, fg = c.polar_night.origin },
                    -- MiniHipatternsFixme =       { bg = c.aurora.red, fg = c.snow_storm.origin },
                    -- MiniHipatternsTestme =      { bg = c.aurora.purple, fg = c.polar_night.origin },
                    -- MiniHipatternsRemoveme =    { bg = c.aurora.orange, fg = c.polar_night.origin },

                    FelineActive =              { bg = "overlay" },
                    FelineInactive =            { bg = "surface" },
                    FelineFilenameActive =      { bg = "pine", fg = "text" },
                    FelineFilenameInactive =    { bg = "highlight_high", fg = "text" },
                    FelineLazyUpdatesActive =   { bg = "iris", fg = "highlight_low" },
                    FelineLazyUpdatesInactive = { bg = "iris", fg = "highlight_low" },
                    FelineSearchCountActive =   { bg = "rose", fg = "highlight_low" },
                    FelineSearchCountInactive = { bg = "rose", fg = "highlight_low" },
                    FelineFileChangesActive =   { bg = "pine", fg = "text" },
                    FelineFileChangesInactive = { bg = "highlight_high", fg = "text" },
                    FelineGrappleActive =       { bg = "foam", fg = "highlight_low" },
                    FelineGrappleInactive =     { bg = "highlight_high", fg = "text" },
                    FelineQfActive =            { bg = "foam", fg = "highlight_low" },
                    FelineQfInactive =          { bg = "highlight_high", fg = "text" },
                    -- stylua: ignore end
                },
            })

            vim.cmd("colorscheme rose-pine")
        end,
    },
}
