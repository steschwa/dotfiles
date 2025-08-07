#!/usr/bin/env nu

git branch --format '%(refname:short)@@@%(HEAD)@@@%(upstream:track,nobracket)@@@%(upstream:short)@@@%(contents:subject)'
| lines
| split column '@@@' branch current status upstream msg
| update branch {|row|
    if $row.current == "*" {
        $"(ansi green)($in)(ansi reset)" 
    } else {
        $in
    }
}
| update status {
    if ($in | is-empty) {
        $"(ansi dark_gray)up-to-date(ansi reset)"
    } else if ($in == "gone") {
        $"(ansi red)($in)(ansi reset)"
    } else if ($in starts-with "ahead") {
        $"(ansi magenta)($in)(ansi reset)"
    } else if ($in starts-with "behind") {
        $"(ansi yellow)($in)(ansi reset)"
    } else {
        $in
    }
}
| update upstream {
    if ($in | is-empty) {
        $"(ansi yellow)none(ansi reset)"
    } else {
        $in
    }
}
| reject current
