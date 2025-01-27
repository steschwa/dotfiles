--- @class KeymapOpts
--- @field remap? boolean
--- @field silent? boolean
--- @field nowait? boolean
--- @field buffer? number

--- @type KeymapOpts
local DEFAULT_OPTS = {
    remap = false,
    silent = true,
    nowait = true,
}

local M = {}

--- @param mode string|string[]
--- @param lhs string
--- @param rhs string|function
--- @param opts? KeymapOpts
function M.keymap(mode, lhs, rhs, opts)
    opts = opts or {}
    opts = vim.tbl_extend("force", DEFAULT_OPTS, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

return M
