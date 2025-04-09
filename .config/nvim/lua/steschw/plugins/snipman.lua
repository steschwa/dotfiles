return {
    "steschwa/snipman.nvim",
    version = "*",
    lazy = true,
    opts = {
        snippets_by_ft = {
            go = {
                { "main", require("steschw.snippets.go.main") },
            },
            html = {
                { "doc", require("steschw.snippets.html.document") },
            },
            scss = {
                { "sclass", require("steschw.snippets.css.class-from-filename") },
            },
            typescript = {
                { "log", require("steschw.snippets.typescript.console-log") },
                { "imp", require("steschw.snippets.typescript.import-statement") },
                { "hook", require("steschw.snippets.typescript.react-hook") },
            },
            typescriptreact = {
                { "imp", require("steschw.snippets.typescript.import-statement") },
                { "log", require("steschw.snippets.typescript.console-log") },
                { "hook", require("steschw.snippets.typescript.react-hook") },

                { "scomp", require("steschw.snippets.react.component") },
                { "sclass", require("steschw.snippets.react.component-classname") },
                { "scss", require("steschw.snippets.react.component-scss") },
                { "sprops", require("steschw.snippets.react.component-props") },
            },
            tex = {
                { "info", require("steschw.snippets.latex.info") },
            },
        },
    },
}
