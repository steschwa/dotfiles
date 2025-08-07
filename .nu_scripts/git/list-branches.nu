git branch --format '%(refname:short)@@@%(HEAD)@@@%(upstream:track,nobracket)@@@%(upstream:short)@@@%(contents:subject)'
| lines
| split column '@@@' branch current raw_status upstream msg
| update branch {|row|
    if $row.current == "*" {
        $"(ansi green)($in)(ansi reset)" 
    } else {
        $in
    }
}
| insert status {|row|
    let track_status = $row.raw_status

    if ($track_status | is-empty) {
        $"(ansi dark_gray)up-to-date(ansi reset)"
    } else if $track_status == "gone" {
        $"(ansi red)($track_status)(ansi reset)"
    } else if $track_status starts-with "ahead" {
        $"(ansi magenta)($track_status)(ansi reset)"
    } else if $track_status starts-with "behind" {
        $"(ansi yellow)($track_status)(ansi reset)"
    } else {
        $track_status
    }
}
| update upstream {|row|
    if ($in | is-empty) {
        $"(ansi yellow)none(ansi reset)"
    } else if $row.raw_status == "gone" {
        $"(ansi red)($in)(ansi reset)"
    } else {
        $in
    }
}
| select branch status upstream msg
