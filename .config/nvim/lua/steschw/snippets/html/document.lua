local ls = require("luasnip")
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return fmt(
    [[
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>{Title}</title>

        <!-- <script src="https://cdn.tailwindcss.com"></script>-->
        <link rel="stylesheet" href="./index.css" />
    </head>
    <body>
        {}
        <script type="module" src="./index.js"></script>
    </body>
</html>
]],
    {
        Title = i(1),
        i(0),
    }
)
