return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.nushell = {
                cmd = {
                    "/opt/homebrew/bin/nu",
                    "--config",
                    "~/.config/nushell/config.nu",
                    "--env-config",
                    "~/.config/nushell/env.nu",
                    "--lsp",
                },
            }
        end,
    },
}
