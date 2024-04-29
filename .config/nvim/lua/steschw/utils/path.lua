local M = {}

--- @param path string
--- @return string
function M.format_path_peak(path)
    local parts = vim.split(path, "/")
    if #parts < 2 then
        return path
    end

    local folder = parts[#parts - 1]
    local filename = parts[#parts]

    return string.format("%s/%s", folder, filename)
end

return M
