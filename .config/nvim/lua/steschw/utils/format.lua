local M = {}

--- @param str string
--- @return string
function M.to_kebab_case(str)
    return str:gsub("(%l)(%u)", "%1-%2"):lower()
end

--- @param str string
--- @return string
function M.to_title_case(str)
    local res, _ = str:gsub("^%l", string.upper)
    return res
end

--- @param str string
--- @return string
function M.to_camel_case(str)
    local res, _ = str:gsub("^%u", string.lower)
    return res
end

return M
