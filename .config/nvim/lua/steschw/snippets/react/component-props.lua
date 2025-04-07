local Fs = require("steschw.utils.fs")

return function()
    return string.format(
        [[
type %sProps = {
    $0
};
]],
        Fs.filename
    )
end
