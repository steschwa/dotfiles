-- MasonInstall dockerfile-language-server
-- MasonInstall docker-compose-language-server

return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.dockerls = {}
            opts.servers.docker_compose_language_service = {}
        end,
    },
}
