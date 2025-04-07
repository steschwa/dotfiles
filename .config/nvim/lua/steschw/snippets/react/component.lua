local Fs = require("steschw.utils.fs")

return function()
    local filename = Fs.filename()

    return string.format(
        [[
type %sProps = {};

export function %s(props: %sProps) {
    return ${0:null};
}
]],
        filename,
        filename,
        filename
    )
end
