return {
    "gbprod/nord.nvim",
    enabled = false,
    -- priority = 1000,
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

                hl["FixmeFilepath"] =           { link = "Directory" }
                hl["FixmeText"] =               { fg = c.snow_storm.origin }
                hl["FixmeColumnSeparator"] =    { link = "Comment" }
                hl["QuickFixLine"] =            { bg = c.polar_night.brighter }

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

                -- vim.cmd("colorscheme nord")
            end,
        })
    end,
}
