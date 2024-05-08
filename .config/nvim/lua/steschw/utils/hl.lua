local M = {}

--- @param name string
--- @param key string
--- @return string
local function get_hl(name, key)
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name })
    if not ok then
        return ""
    end

    if hl[key] then
        return string.format("#%06x", hl[key])
    end

    return ""
end

--- @param name string
--- @return string
function M.get_bg(name)
    return get_hl(name, "bg")
end

--- @param name string
--- @return string
function M.get_fg(name)
    return get_hl(name, "fg")
end

return M
