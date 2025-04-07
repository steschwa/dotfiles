local Fs = require("steschw.utils.fs")
local Format = require("steschw.utils.format")

return function()
    return string.format(
        [[
type %sReturn = {};

export function %s(): %sReturn {
    $0
}
    ]],
        Format.to_title_case(Fs.filename()),
        Fs.filename(),
        Format.to_title_case(Fs.filename())
    )
end
