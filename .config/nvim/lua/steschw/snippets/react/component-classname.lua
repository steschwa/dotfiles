local Fs = require("steschw.utils.fs")
local Format = require("steschw.utils.format")

return function()
    return Format.to_kebab_case(Fs.filename())
end
