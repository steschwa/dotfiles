return {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
        ---@diagnostic disable-next-line: missing-fields
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
                Selection = { fg = "rose", reverse = true },
                SnippetTabstop = {},
                FloatNormal = { bg = "surface" },
                FloatBorder = { bg = "surface", fg = "surface" },
                FloatTitle = { bg = "overlay", fg = "text" },
                FloatFooter = { bg = "surface", fg = "surface" },

                Pmenu = { link = "FloatNormal" },
                PmenuSel = { link = "Selection" },
                NormalFloat = { link = "FloatNormal" },

                TelescopePreviewNormal = { link = "FloatNormal" },
                TelescopePreviewBorder = { bg = "surface", fg = "base" },
                TelescopePreviewTitle = { link = "FloatTitle" },
                TelescopeResultsNormal = { link = "FloatNormal" },
                TelescopeResultsBorder = { bg = "surface", fg = "base" },
                -- NOTE: prompt input line u ses "CursorLine" highlight group,
                TelescopePromptNormal = { bg = "overlay" },
                TelescopePromptBorder = { bg = "overlay", fg = "gold" },
                TelescopePromptTitle = { bg = "overlay", fg = "subtle" },
                TelescopeMultiIcon = { fg = "gold" },
                TelescopeMultiSelection = { fg = "gold" },
                TelescopeMatching = { fg = "rose", underline = true },

                BlinkCmpDoc = { link = "FloatNormal" },
                BlinkCmpDocBorder = { link = "FloatBorder" },
                BlinkCmpDocSeparator = { link = "FloatBorder" },

                FixmeFilepath = { fg = "text" },
                FixmeText = { fg = "subtle" },
                FixmeColumnSeparator = { fg = "overlay" },

                StatusLine = { bg = "overlay" },
                StatusLineNC = { bg = "surface" },
                StatusLineFilenameActive = { bg = "pine", fg = "text" },
                StatusLineFilenameInactive = { bg = "highlight_high", fg = "text" },
                StatusLineFileChangesActive = { bg = "pine", fg = "text" },
                StatusLineFileChangesInactive = { bg = "highlight_high", fg = "text" },
                StatusLineGrappleActive = { bg = "foam", fg = "highlight_low" },
                StatusLineGrappleInactive = { bg = "highlight_high", fg = "text" },
                StatusLineQfActive = { bg = "foam", fg = "highlight_low" },
                StatusLineQfInactive = { bg = "highlight_high", fg = "text" },
                StatusLineLazyUpdates = { bg = "iris", fg = "highlight_low" },
                StatusLineSearchCount = { bg = "rose", fg = "highlight_low" },
                StatusLineGitConflicts = { bg = "overlay", fg = "iris" },
                StatusLineDiagnosticError = { bg = "overlay", fg = "love" },
                StatusLineDiagnosticWarn = { bg = "overlay", fg = "gold" },
                StatusLineDiagnosticInfo = { bg = "overlay", fg = "foam" },
                StatusLineDiagnosticHint = { bg = "overlay", fg = "iris" },

                GitBlameTime = { fg = "foam" },
                GitBlameAuthor = { fg = "iris" },
                GitBlameMessage = { fg = "text" },

                GitConflictCurrentLabel = { bg = "foam", fg = "overlay" },
                GitConflictCurrent = { bg = "foam", blend = 25 },
                GitConflictIncomingLabel = { bg = "rose", fg = "overlay" },
                GitConflictIncoming = { bg = "rose", blend = 25 },
                GitConflictAncestorLabel = { fg = "muted" },
            },
        })
        vim.cmd("colorscheme rose-pine")
    end,
}
