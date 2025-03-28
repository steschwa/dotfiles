return {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    cmd = "TodoQuickFix",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "fixme.nvim",
    },
    opts = {
        signs = false,
        merge_keywords = false,
        keywords = {
            TODO = { color = "info" },
            FIXME = { color = "error" },
            REFACTOR = { color = "warning" },
            TESTME = { color = "hint" },
            NOTE = { color = "hint" },
            REMOVEME = { color = "error" },
        },
        gui_style = {
            fg = "NONE",
            bg = "NONE",
        },
        highlight = {
            before = "",
            keyword = "bg",
            after = "",
        },
        colors = {
            error = { "DiagnosticError" },
            warning = { "DiagnosticWarn" },
            info = { "DiagnosticInfo" },
            hint = { "DiagnosticHint" },
        },
    },
}
