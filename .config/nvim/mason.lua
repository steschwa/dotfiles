local reg = require("mason-registry")

---@param name string
local function install_package(name)
    if reg.is_installed(name) then
        vim.print(string.format("✅ %s already installed", name))
        return
    end

    vim.cmd.MasonInstall(name)
    vim.print(string.format("⌛ %s installed just now", name))
end

-- LSPs
install_package("biome")
install_package("css-lsp")
install_package("docker-compose-language-service")
install_package("dockerfile-language-server")
install_package("eslint-lsp")
install_package("gopls")
install_package("html-lsp")
install_package("json-lsp")
install_package("lua-language-server")
install_package("marksman")
install_package("postgrestools")
install_package("pyright")
install_package("ruff")
install_package("tailwindcss-language-server")
install_package("texlab")
install_package("vtsls")
install_package("yaml-language-server")
install_package("golangci-lint-langserver")

-- Formatters
install_package("bibtex-tidy")
install_package("biome")
install_package("golangci-lint")
install_package("prettierd")
install_package("ruff")
install_package("sqruff")
install_package("stylua")
install_package("taplo")
install_package("tex-fmt")

-- Linters
install_package("actionlint")
install_package("sqruff")
