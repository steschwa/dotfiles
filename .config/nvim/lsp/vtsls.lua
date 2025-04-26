return {
    settings = {
        vtsls = {
            autoUseWorkspaceTsdk = true,
            typescript = {
                preferences = {
                    importModuleSpecifier = "non-relative",
                },
            },
        },
    },
    ---@type vim.lsp.client.on_attach_cb
    on_attach = function(_, bufnr)
        local keymap_opts = { buffer = bufnr }

        local keymap = require("steschw.utils.keys").keymap

        keymap("n", "gu", "<cmd>VtsExec remove_unused_imports<cr>", keymap_opts)
        keymap("n", "gi", "<cmd>VtsExec add_missing_imports<cr>", keymap_opts)
    end,
}
