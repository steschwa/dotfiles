export-env {
    let completer = {|spans|
        # if the current command is an alias, get it's expansion
        let expanded_alias = (scope aliases | where name == $spans.0 | get --optional 0?.expansion?)

        mut spans = $spans
        if $expanded_alias != null  {
            # put the first word of the expanded alias first in the span
            $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
        }

        go run . _carapace nushell ...$spans | from json
    }

    $env.config.completions.external = {
        enable: true,
        max_results: 100,
        completer: $completer
    } 
}
