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

                FixmeFilepath =             { fg = "text" },
                FixmeText =                 { fg = "subtle" },
                FixmeColumnSeparator =      { fg = "overlay" },
                QuickFixLine =              { bg = "highlight_med" },

                MiniHipatternsTodo =        { bg = "pine", fg = "text" },
                MiniHipatternsRefactor =    { bg = "foam", fg = "highlight_low" },
                MiniHipatternsFixme =       { bg = "love", fg = "highlight_low" },
                MiniHipatternsTestme =      { bg = "iris", fg = "highlight_low" },
                MiniHipatternsRemoveme =    { bg = "rose", fg = "highlight_low" },

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
