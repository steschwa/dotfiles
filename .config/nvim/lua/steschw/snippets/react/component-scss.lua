local Fs = require("steschw.utils.fs")

return function()
    local filename = Fs.filename()
    local import_source = filename:sub(1, 1):lower() .. filename:sub(2)

    return string.format('import "./%s.scss";', import_source)
end
