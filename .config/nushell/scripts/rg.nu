export def "from rg" [] {
    $in
    | lines
    |  parse '{filename}:{lnum}:{text}'
    | each {|it|
        $it | update text ($it.text | str trim)
    }
}
