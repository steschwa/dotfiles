#!/usr/bin/env nu --config ~/.config/nushell/config.nu

git branch --format '%(refname:short)@@@%(HEAD)@@@%(upstream:track,nobracket)@@@%(upstream:short)@@@%(contents:subject)'
| lines
| split column '@@@' raw_branch current raw_status upstream msg
| insert branch {|row|
    if $row.current == "*" {
        $"(ansi green)($row.raw_branch)(ansi reset)" 
    } else {
        $row.raw_branch
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
        $"(ansi magenta)($track_status)(ansi reset)"
    } else {
        $track_status
    }
}
| update upstream {|row|
    if ($in | is-empty) {
        $"(ansi magenta)none(ansi reset)"
    } else if $row.raw_status == "gone" {
        $"(ansi red)($in)(ansi reset)"
    } else if not ($in ends-with $"/($row.raw_branch)") {
        $"(ansi yellow)($in)(ansi reset)"
    } else {
        $in
    }
}
| select branch status upstream msg
