#!/usr/bin/env nu

git branch --format '%(refname:short)@@@%(upstream:track,nobracket)@@@%(upstream:short)@@@%(contents:subject)'
| lines
| split column '@@@' branch status upstream msg
| update status {
    if ($in | is-empty) {
        $"(ansi green)up-to-date(ansi reset)"
    } else {
        $"(ansi yellow)($in)(ansi reset)"
    }
}
| update upstream {
    if ($in | is-empty) {
        $"(ansi yellow)none(ansi reset)"
    } else {
        $in
    }
}
