local Fs = require("steschw.utils.fs")
local Format = require("steschw.utils.format")

return function()
    return string.format(
        [[
.%s {
    $0
}
]],
        Format.to_kebab_case(Fs.filename())
    )
end
