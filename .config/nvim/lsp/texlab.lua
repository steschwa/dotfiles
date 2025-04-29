return {
    settings = {
        texlab = {
            build = {
                executable = "tectonic",
                args = {
                    "-X",
                    "compile",
                    "%f",
                    "--synctex",
                    "--keep-logs",
                    "--keep-intermediates",
                },
            },
            forwardSearch = {
                executable = "sioyek",
                args = {
                    "--reuse-window",
                    "--execute-command",
                    "toggle_synctex",
                    "--inverse-search",
                    'texlab inverse-search -i "%%1" -l %%2',
                    "--forward-search-file",
                    "%f",
                    "--forward-search-line",
                    "%l",
                    "%p",
                },
            },
        },
    },
}
