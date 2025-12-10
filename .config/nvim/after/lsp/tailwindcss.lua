---@type vim.lsp.Config
return {
    settings = {
        tailwindCSS = {
            classAttributes = {
                "class",
                "className",
                "class:list",
                "classList",
                "ngClass",
                --
                "classNames",
            },
            classFunctions = {
                "clsx",
            },
        },
    },
}
