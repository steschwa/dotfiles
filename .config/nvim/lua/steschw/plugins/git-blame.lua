local function provider_sha(blame)
    return { text = blame.sha:sub(1, 10), hl = "Comment" }
end

local function provider_time(blame)
    local formatted_time = vim.fn.strftime("%d.%m.%Y %H:%M", blame.timestamp)
    return { text = formatted_time, hl = "GitBlameTime" }
end

local function provider_author(blame)
    local formatted_author = string.format("%s %s", blame.author, blame.author_email)
    return { text = formatted_author, hl = "GitBlameAuthor" }
end

local function provider_message(blame)
    return { text = blame.message, hl = "GitBlameMessage" }
end

local function provider_separator(separator)
    return function()
        return { text = separator, hl = "Comment" }
    end
end

return {
    dir = "/Volumes/Projekte/git-blame.nvim",
    name = "git-blame.nvim",
    cmd = "GitBlameLine",
    keys = {
        { "gb", "<cmd>GitBlameLine<cr>" },
    },
    opts = {
        lines = {
            { provider_time, provider_separator(" @ "), provider_sha },
            { provider_author },
            {},
            { provider_message },
        },
    },
}
