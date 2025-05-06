---@type git-blame.Provider
local provider_sha = function(blame)
    local formatted_sha = blame.sha:sub(1, 10)
    return { text = string.format(" @ %s", formatted_sha), hl = "Comment" }
end

---@type git-blame.Provider
local provider_time = function(blame)
    local formatted_time = vim.fn.strftime("%d.%m.%Y %H:%M", blame.timestamp)
    return { text = formatted_time, hl = "GitBlameTime" }
end

---@type git-blame.Provider
local provider_author = function(blame)
    local formatted_author = string.format("%s %s", blame.author, blame.author_email)
    return { text = formatted_author, hl = "GitBlameAuthor" }
end

---@type git-blame.Provider
local provider_message = function(blame)
    return { text = blame.message, hl = "GitBlameMessage" }
end

return {
    "steschwa/git-blame.nvim",
    version = "*",
    cmd = "GitBlameLine",
    keys = {
        { "gb", "<cmd>GitBlameLine<cr>" },
    },
    opts = {
        lines = {
            { provider_time, provider_sha },
            { provider_author },
            {},
            { provider_message },
        },
        window = {
            border = "solid",
        },
    },
}
