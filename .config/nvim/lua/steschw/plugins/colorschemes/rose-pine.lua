return {
    "rose-pine/neovim",
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
}
